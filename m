From: Chris Peterson <cpeterso@cpeterso.com>
Date: Mon, 12 Sep 2011 12:59:01 +0000
Subject: [PATCH] drivers: rename some function parameters from 'register' to 'reg'
Message-Id: <1315832341-917-1-git-send-email-cpeterso@cpeterso.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Some function prototypes declare an 'int register' parameter. gcc -W warns
"‘register’ is not at beginning of declaration" because the compiler thinks
the parameter has been marked as a 'register' variable but the author
just wanted to name the parameter "register" (which is a reserved keyword).

Signed-off-by: Chris Peterson <cpeterso@cpeterso.com>
---
 drivers/hwmon/w83791d.c                 |    4 ++--
 drivers/isdn/hardware/eicon/platform.h  |    2 +-
 drivers/net/wireless/airo.c             |    4 ++--
 drivers/staging/comedi/drivers/ni_stc.h |    8 ++++----
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 17cf1ab..8c2844e 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -329,8 +329,8 @@ static int w83791d_detect(struct i2c_client *client,
 			  struct i2c_board_info *info);
 static int w83791d_remove(struct i2c_client *client);
 
-static int w83791d_read(struct i2c_client *client, u8 register);
-static int w83791d_write(struct i2c_client *client, u8 register, u8 value);
+static int w83791d_read(struct i2c_client *client, u8 reg);
+static int w83791d_write(struct i2c_client *client, u8 reg, u8 value);
 static struct w83791d_data *w83791d_update_device(struct device *dev);
 
 #ifdef DEBUG
diff --git a/drivers/isdn/hardware/eicon/platform.h b/drivers/isdn/hardware/eicon/platform.h
index 15d4942..128941c 100644
--- a/drivers/isdn/hardware/eicon/platform.h
+++ b/drivers/isdn/hardware/eicon/platform.h
@@ -206,7 +206,7 @@ void PCIread (byte bus, byte func, int offset, void* data, int length, void* pci
 /*
 **  I/O Port utilities
 */
-int diva_os_register_io_port (void *adapter, int register, unsigned long port,
+int diva_os_register_io_port (void *adapter, int reg, unsigned long port,
 				unsigned long length, const char* name, int id);
 /*
 **  I/O port access abstraction
diff --git a/drivers/net/wireless/airo.c b/drivers/net/wireless/airo.c
index e1b3e3c..ba266c1 100644
--- a/drivers/net/wireless/airo.c
+++ b/drivers/net/wireless/airo.c
@@ -1102,8 +1102,8 @@ static const char version[] = "airo.c 0.6 (Ben Reed & Javier Achirica)";
 struct airo_info;
 
 static int get_dec_u16( char *buffer, int *start, int limit );
-static void OUT4500( struct airo_info *, u16 register, u16 value );
-static unsigned short IN4500( struct airo_info *, u16 register );
+static void OUT4500(struct airo_info *, u16 reg, u16 value);
+static unsigned short IN4500(struct airo_info *, u16 reg);
 static u16 setup_card(struct airo_info*, u8 *mac, int lock);
 static int enable_MAC(struct airo_info *ai, int lock);
 static void disable_MAC(struct airo_info *ai, int lock);
diff --git a/drivers/staging/comedi/drivers/ni_stc.h b/drivers/staging/comedi/drivers/ni_stc.h
index 504ea71..7f09388 100644
--- a/drivers/staging/comedi/drivers/ni_stc.h
+++ b/drivers/staging/comedi/drivers/ni_stc.h
@@ -1429,10 +1429,10 @@ struct ni_board_struct {
 #define NUM_GPCT 2
 
 #define NI_PRIVATE_COMMON					\
-	uint16_t (*stc_readw)(struct comedi_device *dev, int register);	\
-	uint32_t (*stc_readl)(struct comedi_device *dev, int register);	\
-	void (*stc_writew)(struct comedi_device *dev, uint16_t value, int register);	\
-	void (*stc_writel)(struct comedi_device *dev, uint32_t value, int register);	\
+	uint16_t (*stc_readw)(struct comedi_device *dev, int reg);	\
+	uint32_t (*stc_readl)(struct comedi_device *dev, int reg);	\
+	void (*stc_writew)(struct comedi_device *dev, uint16_t value, int reg);	\
+	void (*stc_writel)(struct comedi_device *dev, uint32_t value, int reg);	\
 	\
 	unsigned short dio_output;				\
 	unsigned short dio_control;				\
-- 
1.7.4.1

