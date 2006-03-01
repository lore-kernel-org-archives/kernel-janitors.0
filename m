From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 01 Mar 2006 07:29:45 +0000
Subject: [KJ][Patch][update] check return value of request_region in
Message-Id: <1141198185.7784.9.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6706138286233142=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6706138286233142==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

Sorry about the last patch I forgot to compile test it first.
Here is the patch you want.

matroxfb_base.c calles 'request_region' @ 1737 without checking the
return value.

The patch below adds a check for this and plugs into the existing error
path.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/sound/oss/ali5455.c.orig	2006-03-01 17:52:40.000000000 +1100
+++ linux-2.6.16-rc5/sound/oss/ali5455.c	2006-03-01 18:25:34.000000000 +1100
@@ -3457,7 +3457,13 @@ static int __devinit ali_probe(struct pc
 	card->channel[4].port = 0xb0;
 	card->channel[4].num = 4;
 	/* claim our iospace and irq */
-	request_region(card->iobase, 256, card_names[pci_id->driver_data]);
+	if (!request_region(card->iobase, 256, 
+				card_names[pci_id->driver_data])) {
+		printk(KERN_ERR "ali_audio: request_region failed");
+		kfree(card);
+		return -EBUSY;
+	}
+	
 	if (request_irq(card->irq, &ali_interrupt, SA_SHIRQ,
 			card_names[pci_id->driver_data], card)) {
 		printk(KERN_ERR "ali_audio: unable to allocate irq %d\n",



--===============6706138286233142==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6706138286233142==--
