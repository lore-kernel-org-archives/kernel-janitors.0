From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:33 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111133.GA3541@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39843958913086874=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============39843958913086874==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each/
Compile tested.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/tulip/de4x5.c	Fri Jul 23 16:00:23 2004
+++ list_for_each/drivers/net/tulip/de4x5.c	Thu Aug 19 12:50:26 2004
@@ -2143,9 +2143,9 @@
     u_long iobase = 0;                     /* Clear upper 32 bits in Alphas */
     int i, j, cfrv;
     struct de4x5_private *lp = netdev_priv(dev);
-    struct list_head *walk = &pdev->bus_list;
+    struct list_head *walk;
 
-    for (walk = walk->next; walk != &pdev->bus_list; walk = walk->next) {
+    list_for_each(walk, &pdev->bus_list) {
 	struct pci_dev *this_dev = pci_dev_b(walk);
 
 	/* Skip the pci_bus list entry */

--===============39843958913086874==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39843958913086874==--
