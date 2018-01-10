From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:23:13 +0000
Subject: [PATCH 0/7] VMCI: Adjustments for several function implementations
Message-Id: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 20:13:45 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (7):
  Delete error messages for a failed memory allocation in seven functions
  Improve a size determination in two functions
  Update a word in five comment lines
  Delete an unnecessary null pointer check in qp_broker_create()
  Delete an unnecessary variable initialisation in qp_broker_create()
  Less function calls in qp_broker_create() after error detection
  Adjust 32 checks for null pointers

 drivers/misc/vmw_vmci/vmci_context.c    | 24 +++++++-------
 drivers/misc/vmw_vmci/vmci_datagram.c   | 14 ++++----
 drivers/misc/vmw_vmci/vmci_doorbell.c   |  8 ++---
 drivers/misc/vmw_vmci/vmci_guest.c      | 16 +++------
 drivers/misc/vmw_vmci/vmci_host.c       | 10 ++----
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 57 ++++++++++++++++-----------------
 6 files changed, 54 insertions(+), 75 deletions(-)

-- 
2.15.1

