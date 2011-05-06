From: matt mooney <mfm@muteddisk.com>
Date: Fri, 06 May 2011 10:47:40 +0000
Subject: [PATCH 00/16] staging: usbip: cleanup
Message-Id: <cover.1304676742.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Greg,

Here is a set of extremely trivial changes; more substantial changes
will follow.

Thanks,
matt

matt mooney (16):
  staging: usbip: stub_dev.c: coding style cleanup
  staging: usbip: stub_main.c: coding style cleanup
  staging: usbip: stub_rx.c: coding style cleanup
  staging: usbip: stub_tx.c: coding style cleanup
  staging: usbip: usbip_common.h: coding style cleanup
  staging: usbip: usbip_common.c: coding style cleanup
  staging: usbip: usbip_event.c: coding style cleanup
  staging: usbip: stub.h: coding style cleanup
  staging: usbip: vhci.h: coding style cleanup
  staging: usbip: vhci_hcd.c: coding style cleanup
  staging: usbip: vhci_rx.c: coding style cleanup
  staging: usbip: vhci_sysfs.c: coding style cleanup
  staging: usbip: vhci_tx.c: coding style cleanup
  staging: usbip: add break to default case in switch statements
  staging: usbip: remove section dividers
  staging: usbip: fixup MODULE_ macros

 drivers/staging/usbip/stub.h         |    5 -
 drivers/staging/usbip/stub_dev.c     |   57 ++--------
 drivers/staging/usbip/stub_main.c    |   31 +----
 drivers/staging/usbip/stub_rx.c      |   52 ++++-----
 drivers/staging/usbip/stub_tx.c      |   68 ++++-------
 drivers/staging/usbip/usbip_common.c |  138 ++++++++++-------------
 drivers/staging/usbip/usbip_common.h |   85 +++++---------
 drivers/staging/usbip/usbip_event.c  |   18 +--
 drivers/staging/usbip/vhci.h         |   24 +---
 drivers/staging/usbip/vhci_hcd.c     |  204 +++++++++++++---------------------
 drivers/staging/usbip/vhci_rx.c      |   49 +++------
 drivers/staging/usbip/vhci_sysfs.c   |   15 +--
 drivers/staging/usbip/vhci_tx.c      |   36 ++----
 13 files changed, 278 insertions(+), 504 deletions(-)

-- 
1.7.5.1

