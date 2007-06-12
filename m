From: vignesh babu <vignesh.babu@wipro.com>
Date: Tue, 12 Jun 2007 05:13:01 +0000
Subject: [KJ] [PATCH]is_power_of_2-myri10ge/myri10ge.c
Message-Id: <1181624462.3109.22.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm <akpm@linux-foundation.org>, jgarzik@pobox.com
Cc: netdev@vger.kernel.org, Kernel Janitors List <kernel-janitors@lists.osdl.org>


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/net/myri10ge/myri10ge.c b/drivers/net/myri10ge/myri10ge.c
index b53b7ad..89da958 100644
--- a/drivers/net/myri10ge/myri10ge.c
+++ b/drivers/net/myri10ge/myri10ge.c
@@ -60,6 +60,7 @@
 #include <linux/crc32.h>
 #include <linux/moduleparam.h>
 #include <linux/io.h>
+#include <linux/log2.h>
 #include <net/checksum.h>
 #include <asm/byteorder.h>
 #include <asm/io.h>
@@ -1797,7 +1798,7 @@ static int myri10ge_open(struct net_device *dev)
 	 */
 	big_pow2 = dev->mtu + ETH_HLEN + VLAN_HLEN + MXGEFW_PAD;
 	if (big_pow2 < MYRI10GE_ALLOC_SIZE / 2) {
-		while ((big_pow2 & (big_pow2 - 1)) != 0)
+		while (!is_power_of_2(big_pow2))
 			big_pow2++;
 		mgp->big_bytes = dev->mtu + ETH_HLEN + VLAN_HLEN + MXGEFW_PAD;
 	} else {

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
