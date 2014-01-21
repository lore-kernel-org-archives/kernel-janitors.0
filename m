From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jan 2014 06:52:16 +0000
Subject: [patch] ARM: mvebu: checking for IS_ERR() instead of NULL
Message-Id: <20140121065216.GA31535@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

of_iomap() returns NULL on error, it doesn't return error pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/arm/mach-mvebu/mvebu-soc-id.c b/arch/arm/mach-mvebu/mvebu-soc-id.c
index fe4fc1cbdfaf..b4cfbd62709d 100644
--- a/arch/arm/mach-mvebu/mvebu-soc-id.c
+++ b/arch/arm/mach-mvebu/mvebu-soc-id.c
@@ -88,7 +88,7 @@ static int __init mvebu_soc_id_init(void)
 	}
 
 	pci_base = of_iomap(child, 0);
-	if (IS_ERR(pci_base)) {
+	if (!pci_base) {
 		pr_err("cannot map registers\n");
 		ret = -ENOMEM;
 		goto res_ioremap;
