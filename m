From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 17 Mar 2005 15:09:29 +0000
Subject: [KJ] [PATCH] printk : drivers/isdn/hardware/eicon/divasmain.c
Message-Id: <20050317150929.GQ2102@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="n8884J15jRwcBTvu"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--n8884J15jRwcBTvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
printk() calls should include appropriate KERN_* constant.

Have a nice day,

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--n8884J15jRwcBTvu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-printk-linux-2.6.11_drivers_isdn_hardware_eicon_divasmain.c.diff"

diff -urpN -X dontdiff linux-2.6.11-vanilla/drivers/isdn/hardware/eicon/divasmain.c linux-2.6.11/drivers/isdn/hardware/eicon/divasmain.c
--- linux-2.6.11-vanilla/drivers/isdn/hardware/eicon/divasmain.c	2005-03-02 08:37:49.000000000 +0100
+++ linux-2.6.11/drivers/isdn/hardware/eicon/divasmain.c	2005-03-16 12:26:27.000000000 +0100
@@ -785,14 +785,14 @@ static int DIVA_INIT_FUNCTION divas_init
 	printk(KERN_INFO "%s\n", DRIVERNAME);
 	printk(KERN_INFO "%s: Rel:%s  Rev:", DRIVERLNAME, DRIVERRELEASE_DIVAS);
 	strcpy(tmprev, main_revision);
-	printk("%s  Build: %s(%s)\n", getrev(tmprev),
+	printk(KERN_INFO "%s  Build: %s(%s)\n", getrev(tmprev),
 	       diva_xdi_common_code_build, DIVA_BUILD);
 	printk(KERN_INFO "%s: support for: ", DRIVERLNAME);

--n8884J15jRwcBTvu
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--n8884J15jRwcBTvu--
