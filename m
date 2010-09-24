From: matt mooney <mfm@muteddisk.com>
Date: Fri, 24 Sep 2010 19:17:11 +0000
Subject: [PATCH 01/24] base: change to new flag variable
Message-Id: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org

Replace EXTRA_CFLAGS with ccflags-y.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 drivers/base/Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index c12c7f2..5f51c3b 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -19,7 +19,5 @@ obj-$(CONFIG_MODULES)	+= module.o
 endif
 obj-$(CONFIG_SYS_HYPERVISOR) += hypervisor.o
 
-ifeq ($(CONFIG_DEBUG_DRIVER),y)
-EXTRA_CFLAGS += -DDEBUG
-endif
+ccflags-$(CONFIG_DEBUG_DRIVER) := -DDEBUG
 
-- 
1.7.2.1

