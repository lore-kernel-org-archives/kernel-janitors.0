From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 13:17:20 +0000
Subject: [KJ][Patch] Alter prototypes in adm1026.c
Message-Id: <1140182240.7789.44.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10435300410909809=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10435300410909809==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

from http://linuxicc.sourceforge.net/

ICC complains about : Storage Class is not First
@ line 301 & 302 of adm1026.c

It appears that the variable in the prototype is named register which
confuses ICC, it is called (more sensibly) reg in the actual functions.
This is confusing (as register is a keyword) so the patch below re-names
the variable in the prototype to match the actual functions. (reg).

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/hwmon/adm1026.c.orig	2006-02-17 23:25:39.000000000 +1100
+++ linux-2.6.16-rc3/drivers/hwmon/adm1026.c	2006-02-17 23:55:26.000000000 +1100
@@ -298,8 +298,8 @@ static int adm1026_attach_adapter(struct
 static int adm1026_detect(struct i2c_adapter *adapter, int address,
 	int kind);
 static int adm1026_detach_client(struct i2c_client *client);
-static int adm1026_read_value(struct i2c_client *client, u8 register);
-static int adm1026_write_value(struct i2c_client *client, u8 register,
+static int adm1026_read_value(struct i2c_client *client, u8 reg);
+static int adm1026_write_value(struct i2c_client *client, u8 reg,
 	int value); 
 static void adm1026_print_gpio(struct i2c_client *client);
 static void adm1026_fixup_gpio(struct i2c_client *client); 



--===============10435300410909809==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10435300410909809==--
