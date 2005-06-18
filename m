From: David <ddcc@mit.edu>
Date: Sat, 18 Jun 2005 08:40:41 +0000
Subject: [KJ] [PATCH 2.4.28 1/1] networking: improve readability of
Message-Id: <20050618044041.68ba1006@TANG-FOUR-TWENTY-FIVE.MIT.EDU>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59728736880604094=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============59728736880604094==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

A trivial patch to improve the readability of dev_set_promiscuity() in
net/core/dev.c. New code does exactly the same thing as original code.

Signed-off-by: David Chau <ddcc@mit.edu>

--- linux/net/core/dev.c.bak	2005-06-18 03:45:37.000000000 -0400
+++ linux/net/core/dev.c	2005-06-18 03:55:44.000000000 -0400
@@ -1952,10 +1952,11 @@ void dev_set_promiscuity(struct net_devi
 {
 	unsigned short old_flags = dev->flags;
 
-	dev->flags |= IFF_PROMISC;
 	if ((dev->promiscuity += inc) == 0)
 		dev->flags &= ~IFF_PROMISC;
-	if (dev->flags^old_flags) {
+	else
+		dev->flags |= IFF_PROMISC;
+	if (dev->flags != old_flags) {
 #ifdef CONFIG_NET_FASTROUTE
 		if (dev->flags&IFF_PROMISC) {
 			netdev_fastroute_obstacles++;

--===============59728736880604094==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59728736880604094==--
