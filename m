From: peterhuewe@gmx.de
Date: Tue, 22 Dec 2009 08:27:06 +0000
Subject: [PATCH 2/6] isdn/hardware: add __init/__exit macros to isdn/hardware/mISDN/mISDNisar.c
Message-Id: <1261470431-23642-2-git-send-email-peterhuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261470431-23642-1-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1261470431-23642-1-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, Karsten Keil <isdn@linux-pingi.de>, =?UTF-8?q?Andr=C3=A9=20Goddard=20Rosa?= <andre.goddard@gmail.com>, Jiri Kosina <jkosina@suse.cz>, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of

drivers/isdn/hardware/mISDN/mISDNisar.c

Please have a look at the small patch and either pull it through
your tree, or please ack' it so Jiri can pull it through the trivial
tree.

Patch against linux-next-tree, 22. Dez 08:38:18 CET 2009
but also present in linus tree.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/isdn/hardware/mISDN/mISDNisar.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/mISDNisar.c b/drivers/isdn/hardware/mISDN/mISDNisar.c
index 09095c7..f0bc6fa 100644
--- a/drivers/isdn/hardware/mISDN/mISDNisar.c
+++ b/drivers/isdn/hardware/mISDN/mISDNisar.c
@@ -1712,13 +1712,13 @@ mISDNisar_init(struct isar_hw *isar, void *hw)
 }
 EXPORT_SYMBOL(mISDNisar_init);
 
-static int isar_mod_init(void)
+static int __init isar_mod_init(void)
 {
 	pr_notice("mISDN: ISAR driver Rev. %s\n", ISAR_REV);
 	return 0;
 }
 
-static void isar_mod_cleanup(void)
+static void __exit isar_mod_cleanup(void)
 {
 	pr_notice("mISDN: ISAR module unloaded\n");
 }
-- 
1.6.4.4

