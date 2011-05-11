From: matt mooney <mfmooney@gmail.com>
Date: Wed, 11 May 2011 08:54:12 +0000
Subject: [PATCH 00/12] staging: usbip: miscellaneous code cleanup
Message-Id: <cover.1305103212.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Greg,

I am interested in hearing your thoughts on the userspace interface?

Even as is, it definitely needs some work. For one thing I was thinking
of removing the debug flag from userspace. The userspace utilites are
not using it anyway, and it is not 100% working yet.

Thanks,
matt

matt mooney (12):
  staging: usbip: change debug configuration option
  staging: usbip: use single version for all modules
  staging: usbip: fix header includes
  staging: usbip: replace usbip_u{dbg,err,info} and printk with pr_
    equivalent
  staging: usbip: remove unnecessary lines and extra return statements
  staging: usbip: stub_main.c: code cleanup
  staging: usbip: stub_main.c: change __init/__exit prefix and use
    KMEM_CACHE
  staging: usbip: usbip_common.c: fix misspelled function name
  staging: usbip: edit Kconfig and rename CONFIG options
  staging: usbip: stub.h: reorganize
  staging: usbip: vhci.h: reorganize
  staging: usbip: usbip_common.h: reorganize and document request
    headers

 drivers/staging/Makefile             |    2 +-
 drivers/staging/usbip/Kconfig        |   52 +++---
 drivers/staging/usbip/Makefile       |   11 +-
 drivers/staging/usbip/stub.h         |   29 ++--
 drivers/staging/usbip/stub_dev.c     |   30 ++--
 drivers/staging/usbip/stub_main.c    |  225 ++++++++++++--------------
 drivers/staging/usbip/stub_rx.c      |   29 ++--
 drivers/staging/usbip/stub_tx.c      |   31 ++--
 drivers/staging/usbip/usbip_common.c |  262 ++++++++++++++----------------
 drivers/staging/usbip/usbip_common.h |  302 ++++++++++++++++------------------
 drivers/staging/usbip/usbip_event.c  |    4 +-
 drivers/staging/usbip/vhci.h         |   16 ++-
 drivers/staging/usbip/vhci_hcd.c     |  107 +++++-------
 drivers/staging/usbip/vhci_rx.c      |   37 ++---
 drivers/staging/usbip/vhci_sysfs.c   |   19 +-
 drivers/staging/usbip/vhci_tx.c      |   10 +-
 16 files changed, 541 insertions(+), 625 deletions(-)

-- 
1.7.5.1

