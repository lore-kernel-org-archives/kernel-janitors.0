From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Tue, 21 Feb 2006 10:16:34 +0000
Subject: [KJ][Patch] alter prototypes in airo.c platform.h
Message-Id: <1140516994.7780.37.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============056311629809212338=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============056311629809212338==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

This one finishes up the altering prototypes (because they contain
register) patches.

From http://linuxicc.sourceforge.net/

ICC complains about :Storage Class is not First

@ line 231 of platform.h &
@ lines 1078 & 1079 of airo.c

These are caused by the prototypes miss-naming the variables as
"register". Which as it is a keyword is an error.

The patch below renames the variables in the prototypes to match the
functions.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

 --- linux-2.6.16-rc3/drivers/isdn/hardware/eicon/platform.h.orig	2006-02-21 20:32:58.000000000 +1100
+++ linux-2.6.16-rc3/drivers/isdn/hardware/eicon/platform.h	2006-02-21 20:33:30.000000000 +1100
@@ -228,7 +228,7 @@ void PCIread (byte bus, byte func, int o
 /*
 **  I/O Port utilities
 */
-int diva_os_register_io_port (void *adapter, int register, unsigned long port,
+int diva_os_register_io_port (void *adapter, int on, unsigned long port,
 				unsigned long length, const char* name, int id);
 /*
 **  I/O port access abstraction
--- linux-2.6.16-rc3/drivers/net/wireless/airo.c.orig	2006-02-21 20:34:16.000000000 +1100
+++ linux-2.6.16-rc3/drivers/net/wireless/airo.c	2006-02-21 21:04:15.000000000 +1100
@@ -1075,8 +1075,8 @@ static const char version[] = "airo.c 0.
 struct airo_info;
 
 static int get_dec_u16( char *buffer, int *start, int limit );
-static void OUT4500( struct airo_info *, u16 register, u16 value );
-static unsigned short IN4500( struct airo_info *, u16 register );
+static void OUT4500( struct airo_info *, u16 reg, u16 value );
+static unsigned short IN4500( struct airo_info *, u16 reg );
 static u16 setup_card(struct airo_info*, u8 *mac, int lock);
 static int enable_MAC( struct airo_info *ai, Resp *rsp, int lock );
 static void disable_MAC(struct airo_info *ai, int lock);



--===============056311629809212338==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============056311629809212338==--
