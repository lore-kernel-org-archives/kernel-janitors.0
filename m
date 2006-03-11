From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Sat, 11 Mar 2006 14:54:09 +0000
Subject: [KJ][Patch] check request_irq return value in axnet_cs.c
Message-Id: <1142088849.7820.30.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89322042122112144=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142087566.7820.25.camel@localhost.localdomain>
In-Reply-To: <1142087566.7820.25.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============89322042122112144==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

axnet_cs.c calles request_irq without checking its return value in
axnet_open() @ line 573.

The patch below checks the return value and returns -EBUSY on failure.

This one is i386 so is compile tested (yay).

Also the whole file is 4 space indented so I might follow with a patch
to change that to the accepted tab indent style.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>--- linux-2.6.16-rc5/drivers/net/pcmcia/axnet_cs.c.orig	2006-03-12 01:37:33.000000000 +1100
+++ linux-2.6.16-rc5/drivers/net/pcmcia/axnet_cs.c	2006-03-12 01:43:58.000000000 +1100
@@ -570,7 +570,8 @@ static int axnet_open(struct net_device 
 
     link->open++;
 
-    request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, "axnet_cs", dev);
+    if (request_irq(dev->irq, ei_irq_wrapper, SA_SHIRQ, "axnet_cs", dev) < 0)
+        return -EBUSY;
 
     info->link_status = 0x00;
     init_timer(&info->watchdog);



--===============89322042122112144==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89322042122112144==--
