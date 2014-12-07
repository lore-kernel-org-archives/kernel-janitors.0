From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Dec 2014 19:20:54 +0000
Subject: [PATCH 12/20] hp100: fix misspelling of current function in string
Message-Id: <1417980062-25151-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Replace a misspelled function name by %s and then __func__.

This was done using Coccinelle, including the use of Levenshtein distance,
as proposed by Rasmus Villemoes.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch is difficult to summarize, but is available in the cover
letter of this patch series.

 drivers/net/ethernet/hp/hp100.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hp/hp100.c b/drivers/net/ethernet/hp/hp100.c
index 76a6e0c..ae6e30d 100644
--- a/drivers/net/ethernet/hp/hp100.c
+++ b/drivers/net/ethernet/hp/hp100.c
@@ -490,7 +490,8 @@ static int hp100_probe1(struct net_device *dev, int ioaddr, u_char bus,
 
 	eid = hp100_read_id(ioaddr);
 	if (eid = NULL) {	/* bad checksum? */
-		printk(KERN_WARNING "hp100_probe: bad ID checksum at base port 0x%x\n", ioaddr);
+		printk(KERN_WARNING "%s: bad ID checksum at base port 0x%x\n",
+		       __func__, ioaddr);
 		goto out2;
 	}
 
@@ -498,7 +499,9 @@ static int hp100_probe1(struct net_device *dev, int ioaddr, u_char bus,
 	for (i = uc = 0; i < 7; i++)
 		uc += hp100_inb(LAN_ADDR + i);
 	if (uc != 0xff) {
-		printk(KERN_WARNING "hp100_probe: bad lan address checksum at port 0x%x)\n", ioaddr);
+		printk(KERN_WARNING
+		       "%s: bad lan address checksum at port 0x%x)\n",
+		       __func__, ioaddr);
 		err = -EIO;
 		goto out2;
 	}

