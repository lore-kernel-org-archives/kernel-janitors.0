From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 01 Mar 2006 07:12:15 +0000
Subject: [KJ][Patch] check return value of request region in ali5455.c
Message-Id: <1141197136.7784.5.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94740525152809252=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============94740525152809252==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

ali5455.c calls request_region without checking it's return value 
@ line 3460.

The patch below simply checks the return value and copies local error
style.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/sound/oss/ali5455.c.orig	2006-03-01 17:52:40.000000000 +1100
+++ linux-2.6.16-rc5/sound/oss/ali5455.c	2006-03-01 17:58:35.000000000 +1100
@@ -3457,7 +3457,13 @@ static int __devinit ali_probe(struct pc
 	card->channel[4].port = 0xb0;
 	card->channel[4].num = 4;
 	/* claim our iospace and irq */
-	request_region(card->iobase, 256, card_names[pci_id->driver_data]);
+	if (!request_region(card->iobase, 256, 
+				card_names[pci_id->driver_data])) {
+		printk(KERN_ERR "ali_audio: request_region failed");
+		kfree(card);
+		return -EBUSY
+	}
+	
 	if (request_irq(card->irq, &ali_interrupt, SA_SHIRQ,
 			card_names[pci_id->driver_data], card)) {
 		printk(KERN_ERR "ali_audio: unable to allocate irq %d\n",



--===============94740525152809252==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94740525152809252==--
