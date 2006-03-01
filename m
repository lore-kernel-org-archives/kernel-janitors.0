From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 01 Mar 2006 10:34:39 +0000
Subject: [KJ][Patch][take 3] check return value of request_region in
Message-Id: <1141209279.7783.5.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50896769052782442=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50896769052782442==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

Sorry about the last '2' patches now, and thanks Tim for spotting the
missing '\n', in the last patch. (I'm going to bed now because it
appears I need some sleep.)

ali5455.c calls request_region without checking it's return value 
@ line 3460.

The patch below simply checks the return value and copies local error
style.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/sound/oss/ali5455.c.orig	2006-03-01 17:52:40.000000000 +1100
+++ linux-2.6.16-rc5/sound/oss/ali5455.c	2006-03-01 21:10:38.000000000 +1100
@@ -3457,7 +3457,13 @@ static int __devinit ali_probe(struct pc
 	card->channel[4].port = 0xb0;
 	card->channel[4].num = 4;
 	/* claim our iospace and irq */
-	request_region(card->iobase, 256, card_names[pci_id->driver_data]);
+	if (!request_region(card->iobase, 256, 
+				card_names[pci_id->driver_data])) {
+		printk(KERN_ERR "ali_audio: request_region failed\n");
+		kfree(card);
+		return -EBUSY;
+	}
+	
 	if (request_irq(card->irq, &ali_interrupt, SA_SHIRQ,
 			card_names[pci_id->driver_data], card)) {
 		printk(KERN_ERR "ali_audio: unable to allocate irq %d\n",



--===============50896769052782442==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50896769052782442==--
