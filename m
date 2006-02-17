From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 13:33:36 +0000
Subject: [KJ][Patch] alter prototypes in fscpos.c
Message-Id: <1140183216.7789.53.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86686183373240655=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86686183373240655==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

from http://linuxicc.sourceforge.net/

ICC complains about : Storage Class is not First

@ line 92 & 93 of fscpos.c

This appears to be because the variables in the prototypes are called
register which confuses ICC.
This patch converts it to match the actual functions variable name
(reg).

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/hwmon/fscpos.c.orig	2006-02-18 00:22:09.000000000 +1100
+++ linux-2.6.16-rc3/drivers/hwmon/fscpos.c	2006-02-18 00:22:54.000000000 +1100
@@ -89,8 +89,8 @@ static int fscpos_attach_adapter(struct 
 static int fscpos_detect(struct i2c_adapter *adapter, int address, int kind);
 static int fscpos_detach_client(struct i2c_client *client);
 
-static int fscpos_read_value(struct i2c_client *client, u8 register);
-static int fscpos_write_value(struct i2c_client *client, u8 register, u8 value);
+static int fscpos_read_value(struct i2c_client *client, u8 reg);
+static int fscpos_write_value(struct i2c_client *client, u8 reg, u8 value);
 static struct fscpos_data *fscpos_update_device(struct device *dev);
 static void fscpos_init_client(struct i2c_client *client);
 



--===============86686183373240655==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86686183373240655==--
