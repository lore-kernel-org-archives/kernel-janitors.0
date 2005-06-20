From: David <ddcc@mit.edu>
Date: Mon, 20 Jun 2005 01:20:12 +0000
Subject: Re: [KJ] [PATCH 2.4.28 1/1] networking: improve readability of
Message-Id: <20050619212012.4c6801f5@TANG-FOUR-TWENTY-FIVE.MIT.EDU>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43654905206499084=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050618044041.68ba1006@TANG-FOUR-TWENTY-FIVE.MIT.EDU>
In-Reply-To: <20050618044041.68ba1006@TANG-FOUR-TWENTY-FIVE.MIT.EDU>
To: kernel-janitors@vger.kernel.org

--===============43654905206499084==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun 19 Jun 2005 10:41 Domen Puncer <domen@coderock.org> wrote:

> Missing description, Signed-off-by.

Alright, let's try that again:

Patch against 2.6.12. A trivial patch to improve the readability of dev_set_promiscuity() in net/core/dev.c. New code does exactly the same thing as original code.

Signed-off-by: David Chau <ddcc@mit.edu>

--- linux-2.6.12/net/core/dev.c	2005-06-18 13:53:28.000000000 -0400
+++ linux-2.6.12/net/core/dev.c	2005-06-18 13:56:13.000000000 -0400
@@ -2190,10 +2190,11 @@ void dev_set_promiscuity(struct net_devi
 {
 	unsigned short old_flags = dev->flags;
 
-	dev->flags |= IFF_PROMISC;
 	if ((dev->promiscuity += inc) == 0)
 		dev->flags &= ~IFF_PROMISC;
-	if (dev->flags ^ old_flags) {
+	else
+		dev->flags |= IFF_PROMISC;
+	if (dev->flags != old_flags) {
 		dev_mc_upload(dev);
 		printk(KERN_INFO "device %s %s promiscuous mode\n",
 		       dev->name, (dev->flags & IFF_PROMISC) ? "entered" :

--===============43654905206499084==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43654905206499084==--
