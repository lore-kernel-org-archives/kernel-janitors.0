From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Mon, 13 Mar 2006 06:16:56 +0000
Subject: Re: [KJ][Patch] check return value of request_irq in pcnet_cs.c
Message-Id: <1142230617.7791.36.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80882411145183486=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141029654.7765.6.camel@localhost.localdomain>
In-Reply-To: <1141029654.7765.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============80882411145183486==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2006-03-12 at 21:27 -0800, Randy.Dunlap wrote:

> 
> Yes, that's better, but has some "improper" whitespace:
> don't put a space between 0 and ')'.
> 

Ok, here is an even better than the 'improved patch' patch then. :)

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/drivers/net/pcmcia/pcnet_cs.c.orig	2006-03-13 13:25:13.000000000 +1100
+++ linux-2.6.16-rc5/drivers/net/pcmcia/pcnet_cs.c.back	2006-03-13 17:11:54.000000000 +1100
@@ -1033,7 +1033,8 @@ static int pcnet_open(struct net_device 
     link->open++;
 
     set_misc_reg(dev);
-    request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, dev_info, dev);
+    if (request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, dev_info, dev) < 0)
+	return -EBUSY;
 
     info->phy_id = info->eth_phy;
     info->link_status = 0x00;



--===============80882411145183486==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80882411145183486==--
