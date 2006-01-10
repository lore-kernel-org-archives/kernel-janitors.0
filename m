From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 10 Jan 2006 19:59:31 +0000
Subject: Re: [KJ] [Patch] replace MODULE_PARM in net/fs_enet/fs_enet-main.c
Message-Id: <1136923171.7128.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17939615561079547=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1136898275.23005.3.camel@alice>
In-Reply-To: <1136898275.23005.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============17939615561079547==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> > -MODULE_PARM(fs_enet_debug, "i");
> > +module_param(fs_enet_debug, int, 0);
> >  MODULE_PARM_DESC(fs_enet_debug,
> >  		 "Freescale bitmapped debugging message enable value");
> 
> Is there any logic in choosing 0644 over 0 or vice versa?
> 
> /me confused

This should be 0644, sorry. The logic behind this is that you can
change the debug setting during runtime because the file permissions
for the /proc entry allow you to change it. 
For values that are only intended to be command line parameters, 0 is
always a safe bet, so we dont leak information. At least thats how
i understand it :)
Here is the changed patch


Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6.15-git5/drivers/net/fs_enet/fs_enet-main.c.orig	2006-01-10 14:00:05.000000000 +0100
+++ linux-2.6.15-git5/drivers/net/fs_enet/fs_enet-main.c	2006-01-10 14:00:22.000000000 +0100
@@ -58,7 +58,7 @@ MODULE_DESCRIPTION("Freescale Ethernet D
 MODULE_LICENSE("GPL");
 MODULE_VERSION(DRV_MODULE_VERSION);
 
-MODULE_PARM(fs_enet_debug, "i");
+module_param(fs_enet_debug, int, 0644);
 MODULE_PARM_DESC(fs_enet_debug,
 		 "Freescale bitmapped debugging message enable value");
 




--===============17939615561079547==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17939615561079547==--
