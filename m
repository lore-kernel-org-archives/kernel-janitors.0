From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 18 Mar 2005 11:50:49 +0000
Subject: [KJ] [PATCH] printk : drivers/media/dvb/ttpci/av7110_ipack.c
Message-Id: <20050318115049.GG17789@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="maH1Gajj2nflutpK"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hi,

Description:
printk() calls should include appropriate KERN_* constant.

Have a nice day,

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-linux-2.6.11_drivers_media_dvb_ttpci_av7110_ipack.c.diff"

diff -urpN -X dontdiff linux-2.6.11-vanilla/drivers/media/dvb/ttpci/av7110_ipack.c linux-2.6.11/drivers/media/dvb/ttpci/av7110_ipack.c
--- linux-2.6.11-vanilla/drivers/media/dvb/ttpci/av7110_ipack.c	2005-03-02 08:38:07.000000000 +0100
+++ linux-2.6.11/drivers/media/dvb/ttpci/av7110_ipack.c	2005-03-16 11:57:03.000000000 +0100
@@ -24,7 +24,7 @@ int av7110_ipack_init(struct ipack *p, i
 		       void (*func)(u8 *buf, int size, void *priv))
 {
 	if ( !(p->buf = vmalloc(size*sizeof(u8))) ){
-		printk ("Couldn't allocate memory for ipack\n");
+		printk (KERN_WARNING "Couldn't allocate memory for ipack\n");
 		return -ENOMEM;
 	}
 	p->size = size;

--maH1Gajj2nflutpK
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--maH1Gajj2nflutpK--
