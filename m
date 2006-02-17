From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 14:39:37 +0000
Subject: [KJ][Patch] alter prototypes in w83781d.c, w83627hf.c, sis5595.c,
Message-Id: <1140187177.7789.79.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75997647999707274=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75997647999707274==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

To avoid me spamming you further here are the rest of the fixes for
drivers/hwmon/

from http://linuxicc.sourceforge.net/

ICC complains about : Storage class not first.

In all these cases it appears to be because the prototype miss-names the
reg variable as "register" which confuses ICC.

The patch below just re-names them all to reg which fits the actual
functions.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/hwmon/lm78.c.orig	2006-02-18 00:57:30.000000000 +1100
+++ linux-2.6.16-rc3/drivers/hwmon/lm78.c	2006-02-18 00:58:33.000000000 +1100
@@ -157,8 +157,8 @@ static int lm78_isa_attach_adapter(struc
 static int lm78_detect(struct i2c_adapter *adapter, int address, int kind);
 static int lm78_detach_client(struct i2c_client *client);
 
-static int lm78_read_value(struct i2c_client *client, u8 register);
-static int lm78_write_value(struct i2c_client *client, u8 register, u8 value);
+static int lm78_read_value(struct i2c_client *client, u8 reg);
+static int lm78_write_value(struct i2c_client *client, u8 reg, u8 value);
 static struct lm78_data *lm78_update_device(struct device *dev);
 static void lm78_init_client(struct i2c_client *client);
 
--- linux-2.6.16-rc3/drivers/hwmon/lm85.c.orig	2006-02-18 01:00:22.000000000 +1100
+++ linux-2.6.16-rc3/drivers/hwmon/lm85.c	2006-02-18 01:03:17.000000000 +1100
@@ -373,8 +373,8 @@ static int lm85_detect(struct i2c_adapte
 			int kind);
 static int lm85_detach_client(struct i2c_client *client);
 
-static int lm85_read_value(struct i2c_client *client, u8 register);
-static int lm85_write_value(struct i2c_client *client, u8 register, int value);
+static int lm85_read_value(struct i2c_client *client, u8 reg);
+static int lm85_write_value(struct i2c_client *client, u8 reg, int value);
 static struct lm85_data *lm85_update_device(struct device *dev);
 static void lm85_init_client(struct i2c_client *client);
 
--- linux-2.6.16-rc3/drivers/hwmon/sis5595.c.orig	2006-02-18 01:08:06.000000000 +1100
+++ linux-2.6.16-rc3/drivers/hwmon/sis5595.c	2006-02-18 01:09:34.000000000 +1100
@@ -192,8 +192,8 @@ static struct pci_dev *s_bridge;	/* poin
 static int sis5595_detect(struct i2c_adapter *adapter);
 static int sis5595_detach_client(struct i2c_client *client);
 
-static int sis5595_read_value(struct i2c_client *client, u8 register);
-static int sis5595_write_value(struct i2c_client *client, u8 register, u8 value);
+static int sis5595_read_value(struct i2c_client *client, u8 reg);
+static int sis5595_write_value(struct i2c_client *client, u8 reg, u8 value);
 static struct sis5595_data *sis5595_update_device(struct device *dev);
 static void sis5595_init_client(struct i2c_client *client);
 
--- linux-2.6.16-rc3/drivers/hwmon/w83627hf.c.orig	2006-02-18 01:13:53.000000000 +1100
+++ linux-2.6.16-rc3/drivers/hwmon/w83627hf.c	2006-02-18 01:15:11.000000000 +1100
@@ -325,8 +325,8 @@ struct w83627hf_data {
 static int w83627hf_detect(struct i2c_adapter *adapter);
 static int w83627hf_detach_client(struct i2c_client *client);
 
-static int w83627hf_read_value(struct i2c_client *client, u16 register);
-static int w83627hf_write_value(struct i2c_client *client, u16 register,
+static int w83627hf_read_value(struct i2c_client *client, u16 reg);
+static int w83627hf_write_value(struct i2c_client *client, u16 reg,
 			       u16 value);
 static struct w83627hf_data *w83627hf_update_device(struct device *dev);
 static void w83627hf_init_client(struct i2c_client *client);
--- linux-2.6.16-rc3/drivers/hwmon/w83781d.c.orig	2006-02-18 01:17:15.000000000 +1100
+++ linux-2.6.16-rc3/drivers/hwmon/w83781d.c	2006-02-18 01:19:15.000000000 +1100
@@ -262,8 +262,8 @@ static int w83781d_isa_attach_adapter(st
 static int w83781d_detect(struct i2c_adapter *adapter, int address, int kind);
 static int w83781d_detach_client(struct i2c_client *client);
 
-static int w83781d_read_value(struct i2c_client *client, u16 register);
-static int w83781d_write_value(struct i2c_client *client, u16 register,
+static int w83781d_read_value(struct i2c_client *client, u16 reg);
+static int w83781d_write_value(struct i2c_client *client, u16 reg,
 			       u16 value);
 static struct w83781d_data *w83781d_update_device(struct device *dev);
 static void w83781d_init_client(struct i2c_client *client);



--===============75997647999707274==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75997647999707274==--
