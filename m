From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 19 Apr 2016 12:33:34 +0000
Subject: [PATCH 3/4] mtd: pmc551: add __init attribute
Message-Id: <1461069215-22795-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461069215-22795-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461069215-22795-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Luis R . Rodriguez" <mcgrof@kernel.org>, Josh Triplett <josh@joshtriplett.org>

Add __init attribute on a function that is only called from other __init
functions and that is not inlined, at least with gcc version 4.8.4 on an
x86 machine with allyesconfig.  Currently, the function is put in the
.text.unlikely segment.  Declaring it as __init will cause it to be put in
the .init.text and to disappear after initialization.

The result of objdump -x on the function before the change is as follows:

00000000000000c6 l     F .text.unlikely 000000000000091c fixup_pmc551

And after the change it is as follows:

0000000000000000 l     F .init.text	0000000000000917 fixup_pmc551

Done with the help of Coccinelle.  The semantic patch checks for local
static non-init functions that are called from an __init function and are
not called from any other function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/devices/pmc551.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index 708b7e8..220f920 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -353,7 +353,7 @@ static int pmc551_write(struct mtd_info *mtd, loff_t to, size_t len,
  * mechanism
  * returns the size of the memory region found.
  */
-static int fixup_pmc551(struct pci_dev *dev)
+static int __init fixup_pmc551(struct pci_dev *dev)
 {
 #ifdef CONFIG_MTD_PMC551_BUGFIX
 	u32 dram_data;

