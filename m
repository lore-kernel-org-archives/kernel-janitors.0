From: walter harms <wharms@bfs.de>
Date: Tue, 06 Dec 2005 17:49:03 +0000
Subject: [KJ] drivers/net/cassini.c: fix undefined variable
Message-Id: <4395CF0F.9070206@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060508080908040300020802"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060508080908040300020802
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The variable compwb is not defined if USE_TX_COMPWB is not defined.
Also fixed is a trivial format warning.

in case tunderbird wraped my lines i added the patch as attachment also
sign-off-by: walter <wharms@bfs.de>


--- linux-2.6.14/drivers/net/cassini.c.bak	2005-12-03 2:17:53.000000000 
+0100
+++ linux-2.6.14/drivers/net/cassini.c	2005-12-03 22:41:33.000000000 +0100
@@ -1922,11 +1922,12 @@
  		   u32 status)
  {
          int limit, ring;
+	u64 compwb=0;
  #ifdef USE_TX_COMPWB
-	u64 compwb = le64_to_cpu(cp->init_block->tx_compwb);
+	compwb = le64_to_cpu(cp->init_block->tx_compwb);
  #endif
  	if (netif_msg_intr(cp))
-		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %lx\n",
+		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %Lx\n",
  			cp->dev->name, status, compwb);
  	/* process all the rings */
  	for (ring = 0; ring < N_TX_RINGS; ring++) {

--------------060508080908040300020802
Content-Type: text/x-patch;
 name="cassini.c.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cassini.c.diff"

The variable compwb is not defined if USE_TX_COMPWB is not defined.
Also fixed is a trivial format warning.

sign-off: walter <wharms@bfs.de>


--- linux-2.6.14/drivers/net/cassini.c.bak	2005-12-03 22:17:53.000000000 +0100
+++ linux-2.6.14/drivers/net/cassini.c	2005-12-03 22:41:33.000000000 +0100
@@ -1922,11 +1922,12 @@
 		   u32 status)
 {
         int limit, ring;
+	u64 compwb=0;
 #ifdef USE_TX_COMPWB
-	u64 compwb = le64_to_cpu(cp->init_block->tx_compwb);
+	compwb = le64_to_cpu(cp->init_block->tx_compwb);
 #endif
 	if (netif_msg_intr(cp))
-		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %lx\n",
+		printk(KERN_DEBUG "%s: tx interrupt, status: 0x%x, %Lx\n",
 			cp->dev->name, status, compwb);
 	/* process all the rings */
 	for (ring = 0; ring < N_TX_RINGS; ring++) {

--------------060508080908040300020802
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060508080908040300020802--
