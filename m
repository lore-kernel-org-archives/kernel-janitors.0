From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 18 Mar 2005 14:27:22 +0000
Subject: Re: [KJ] [PATCH] [RESEND] printk :
Message-Id: <20050318142722.GK17789@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="r5lq+205vWdkqwtk"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--r5lq+205vWdkqwtk
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
-		printk("Couldn't allocate memory for ipack\n");
+		printk(KERN_WARNING "Couldn't allocate memory for ipack\n");
 		return -ENOMEM;
 	}
 	p->size = size;

--r5lq+205vWdkqwtk
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--r5lq+205vWdkqwtk--
