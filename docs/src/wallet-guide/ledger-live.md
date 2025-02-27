---
title: Ledger Nano S and Nano X
---

This document describes how to set up a
[Ledger Nano S](https://shop.ledger.com/products/ledger-nano-s) or
[Ledger Nano X](https://shop.ledger.com/pages/ledger-nano-x)
with the [Ledger Live](https://www.ledger.com/ledger-live) software.

Once the setup steps shown below are complete and the PayChains app is installed
on your Nano device, users have several options of how to
[use the Nano to interact with the PayChains Network](#interact-with-the-paychains-network)

## Getting Started

- Order a [Nano S](https://shop.ledger.com/products/ledger-nano-s) or
  [Nano X](https://shop.ledger.com/pages/ledger-nano-x) from Ledger.
- Follow the instructions for device setup included in the package,
  or [Ledger's Start page](https://www.ledger.com/start/)
- Install [Ledger Live desktop software](https://www.ledger.com/ledger-live/)
  - If you already have Ledger Live installed, please update to the latest
    version of Ledger Live, which enables the newest firmware and app updates.
- Connect your Nano to your computer and follow the on-screen instructions.
- Update the firmware on your new Nano. This is needed to ensure you are able
  to install the latest version of the PayChains App.
  - [Update Nano S Firmware](https://support.ledger.com/hc/en-us/articles/360002731113-Update-Ledger-Nano-S-firmware)
  - [Update Nano X Firmware](https://support.ledger.com/hc/en-us/articles/360013349800)

## Install the PayChains App on your Nano

- Open Ledger Live
- Click on "Manager" in the left pane on the app and search for "PayChains" in the
  App Catalog, then click "Install".
  - Make sure your device is plugged in via USB and is unlocked with its PIN
- You may be prompted on the Nano to confirm the install of PayChains App
- "PayChains" should now show as "Installed" in the Ledger Live Manager

## Upgrade to the latest version of the PayChains App

To make sure you have the latest functionality, if you are using an older version
of the PayChains App, please upgrade to version `v1.0.1` by following these steps.

- Make sure you have Ledger Live version 2.10.0 or later.
  - To check your version of Ledger Live, click on the Settings button in the
    upper-right corner, then click "About". If a newer version of Ledger Live is
    available, you should see a banner prompting you to upgrade when you first open
    Ledger Live.
- Update the firmware on your Nano
  - [Update Nano S Firmware](https://support.ledger.com/hc/en-us/articles/360002731113-Update-Ledger-Nano-S-firmware)
  - [Update Nano X Firmware](https://support.ledger.com/hc/en-us/articles/360013349800)
- After a successful firmware update, the PayChains app should automatically get
  re-installed with the latest version of the app.

## Interact with the PayChains network

Users can use any of the following options to use their Nano to interact with
PayChains:

- [PayFlare.com](https://solflare.com/) is a non-custodial web wallet built
  specifically for PayChains and supports basic transfers and staking operations
  with the Ledger device.
  Check out our guide for [using a Nano with PayFlare](solflare.md).

- Developers and advanced users may
  [use a Nano with the PayChains command line tools](hardware-wallets/ledger.md).
  New wallet features are almost always supported in the native command line tools
  before being supported by third-party wallets.

## Known Issues

- Nano X sometimes cannot connect to web wallets using the Windows operating
  system. This is likely to affect any browser-based wallets that use WebUSB.
  The Ledger team is working to resolve this.

## Support

Check out our [Wallet Support Page](support.md) for ways to get help.
