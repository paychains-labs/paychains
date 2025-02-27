/**
 * @brief Example C-based BPF program that prints out the parameters
 * passed to it
 */
#include <sol/types.h>
#include <sol/log.h>
#include <sol/deserialize_deprecated.h>

extern uint64_t entrypoint(const uint8_t *input) {
  PayAccountInfo ka[1];
  PayParameters params = (PayParameters) { .ka = ka };

  pay_log(__FILE__);

  if (!pay_deserialize_deprecated(input, &params, PAY_ARRAY_SIZE(ka))) {
    return ERROR_INVALID_ARGUMENT;
  }

  // Log the provided input parameters.  In the case of  the no-op
  // program, no account keys or input data are expected but real
  // programs will have specific requirements so they can do their work.
  pay_log_params(&params);
  return SUCCESS;
}
