From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 24 Mar 2006 12:02:08 +0000
Subject: [KJ][Patch][update] check return value of request_irq in pcnet_cs.c
Message-Id: <1143201728.8559.5.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21613019217327634=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141198185.7784.9.camel@localhost.localdomain>
In-Reply-To: <1141198185.7784.9.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============21613019217327634==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

Here is an updated patch that will apply to a clean tree.
The only difference between it and the last patch is, it is against the
correctly named file.

This patch is compile tested.


pcnet_cs.c called request_irq without checking its return value @ line
1036.

The patch below just checks the return value and returns -EBUSY on
failure.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-git8/drivers/net/pcmcia/pcnet_cs.c.orig	2006-03-21 23:42:54.000000000 +1100
+++ linux-2.6.16-git8/drivers/net/pcmcia/pcnet_cs.c	2006-03-24 21:01:15.000000000 +1100
@@ -1033,7 +1033,8 @@ static int pcnet_open(struct net_device 
     link->open++;
 
     set_misc_reg(dev);
-    request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, dev_info, dev);
+    if (request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, dev_info, dev) < 0)
+    	return -EBUSY;
 
     info->phy_id = info->eth_phy;
     info->link_status = 0x00;



--===============21613019217327634==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21613019217327634==--
