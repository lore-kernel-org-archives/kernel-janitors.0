From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Mar 2018 16:19:23 +0000
Subject: [PATCH 0/2] VMCI: Adjustments for three function implementations
Message-Id: <66411a1a-fd12-dc31-fc2e-800ff6cea1ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, George Zhang <georgezhang@vmware.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy King <acking@vmware.com>, Dmitry Torokhov <dtor@vmware.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Mar 2018 17:12:34 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user() rather than duplicating its implementation
  Improve a size determination in two functions

 drivers/misc/vmw_vmci/vmci_context.c |  2 +-
 drivers/misc/vmw_vmci/vmci_host.c    | 21 +++++----------------
 2 files changed, 6 insertions(+), 17 deletions(-)

-- 
2.16.2

