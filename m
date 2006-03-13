From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Mon, 13 Mar 2006 05:16:56 +0000
Subject: Re: [KJ][Patch] check return value of request_irq in pcnet_cs.c
Message-Id: <1142227016.7791.31.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18386117812442326=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============18386117812442326==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2006-03-12 at 21:00 -0800, Randy.Dunlap wrote:

> 
> and this built OK for you ???

Good point, I forgot to make it before sending, as I was still editing
the file. 
Sorry about that list, here is an improved patch.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/drivers/net/pcmcia/pcnet_cs.c.orig	2006-03-13 13:25:13.000000000 +1100
+++ linux-2.6.16-rc5/drivers/net/pcmcia/pcnet_cs.c.back	2006-03-13 16:10:50.000000000 +1100
@@ -1033,7 +1033,8 @@ static int pcnet_open(struct net_device 
     link->open++;
 
     set_misc_reg(dev);
-    request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, dev_info, dev);
+    if (request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, dev_info, dev) < 0 )
+	return -EBUSY;
 
     info->phy_id = info->eth_phy;
     info->link_status = 0x00;



--===============18386117812442326==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18386117812442326==--
