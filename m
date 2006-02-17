From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 13:49:15 +0000
Subject: [KJ][Patch] alter prototypes in it87.c
Message-Id: <1140184156.7789.62.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93251377927808043=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93251377927808043==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

from http://linuxicc.sourceforge.net/

ICC complains about : Storage Class is not first

@ line 227 & 228 of it87.c

This appears to be because the variables in the prototypes are called
register which confuses ICC.
This patch converts them to match the actual functions variable names
(reg).

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/hwmon/it87.c.orig	2006-02-18 00:38:03.000000000 +1100
+++ linux-2.6.16-rc3/drivers/hwmon/it87.c	2006-02-18 00:38:47.000000000 +1100
@@ -224,8 +224,8 @@ static int it87_isa_attach_adapter(struc
 static int it87_detect(struct i2c_adapter *adapter, int address, int kind);
 static int it87_detach_client(struct i2c_client *client);
 
-static int it87_read_value(struct i2c_client *client, u8 register);
-static int it87_write_value(struct i2c_client *client, u8 register,
+static int it87_read_value(struct i2c_client *client, u8 reg);
+static int it87_write_value(struct i2c_client *client, u8 reg,
 			u8 value);
 static struct it87_data *it87_update_device(struct device *dev);
 static int it87_check_pwm(struct i2c_client *client);



--===============93251377927808043==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93251377927808043==--
