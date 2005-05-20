From: Jesse Millan <jessem@cs.pdx.edu>
Date: Fri, 20 May 2005 04:50:12 +0000
Subject: [KJ] [PATCH] Fix gcc4 error incomplete array element type
Message-Id: <428D6C84.8070708@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060500090602070705010008"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060500090602070705010008
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This patch is in regards to fixing the gcc 4 warnings. It actually fixes
a gcc 4 error by changing

struct i2c_msg msg[]

to

struct i2c_msg *msg

which is what gcc4 wants to see from now on.

F.Y.I I applied the kj patch, and this error has not been fixed as of
yet. However, I found that this was changed in Andrew Morton mm4 patch.

--------------060500090602070705010008
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.11.10/include/linux/i2c.h.orig	2005-05-19 21:14:35.566833035 -0700
+++ linux-2.6.11.10/include/linux/i2c.h	2005-05-19 21:15:28.920114967 -0700
@@ -55,7 +55,7 @@ extern int i2c_master_recv(struct i2c_cl

 /* Transfer num messages.
  */
-extern int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg msg[],int num);
+extern int i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs,int num);

 /*
  * Some adapter types (i.e. PCF 8584 based ones) may support slave behaviuor.
@@ -194,7 +194,7 @@ struct i2c_algorithm {
 	   to NULL. If an adapter algorithm can do SMBus access, set
 	   smbus_xfer. If set to NULL, the SMBus protocol is simulated
 	   using common I2C messages */
-	int (*master_xfer)(struct i2c_adapter *adap,struct i2c_msg msgs[],
+	int (*master_xfer)(struct i2c_adapter *adap,struct i2c_msg *msgs,
 	                   int num);
 	int (*smbus_xfer) (struct i2c_adapter *adap, u16 addr,
 	                   unsigned short flags, char read_write,

--------------060500090602070705010008
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060500090602070705010008--
