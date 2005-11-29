From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 29 Nov 2005 23:27:20 +0000
Subject: [KJ] [PATCH] ppc: fcc_enet: replace
Message-Id: <20051129232720.GA28870@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45638993481268697=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45638993481268697==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Nishanth Aravamudan <nacc@us.ibm.com>

Use ssleep() instead of schedule_timeout_uninterruptible() to guarantee
the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

Index: linux-kj/arch/ppc/8260_io/fcc_enet.c
===================================================================
--- linux-kj.orig/arch/ppc/8260_io/fcc_enet.c	2005-11-30 02:18:30.000000000 +0300
+++ linux-kj/arch/ppc/8260_io/fcc_enet.c	2005-11-30 02:24:24.000000000 +0300
@@ -1305,11 +1305,9 @@ static void mii_parse_dm9161_scsr(uint m
 
 static void mii_dm9161_wait(uint mii_reg, struct net_device *dev)
 {
-	int timeout = HZ;
-
 	/* Davicom takes a bit to come up after a reset,
 	 * so wait here for a bit */
-	schedule_timeout_uninterruptible(timeout);
+	ssleep(1);
 }
 
 static phy_info_t phy_info_dm9161 = {


--===============45638993481268697==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45638993481268697==--
