From: "Andrew F. Davis" <afd@ti.com>
Date: Mon, 13 Mar 2017 18:20:36 +0000
Subject: [PATCH v2] w1: Organize driver source to natural/common order
Message-Id: <20170313182036.14388-1-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Structures and functions should be ordered such that forward declaration
use is minimized.

MODULE_* macros should immediately follow the structures and functions
upon which they act.

Remaining MODULE_* macros should be at the end of the file in
alphabetical order.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
---

Changes from v1:
 - Added acked-by
 - Rebased on v4.11-rc1
 - CC kernel-janitors

 drivers/w1/masters/ds2482.c    | 45 ++++++++++++++-------------------
 drivers/w1/masters/ds2490.c    | 33 ++++++++++--------------
 drivers/w1/masters/matrox_w1.c | 40 +++++++++++++----------------
 drivers/w1/masters/omap_hdq.c  | 57 ++++++++++++++++++------------------------
 drivers/w1/slaves/w1_bq27000.c |  9 +++----
 drivers/w1/slaves/w1_ds2406.c  |  8 +++---
 drivers/w1/slaves/w1_ds2408.c  | 11 ++++----
 drivers/w1/slaves/w1_ds2413.c  | 10 ++++----
 drivers/w1/slaves/w1_ds2423.c  |  2 +-
 drivers/w1/slaves/w1_ds2431.c  |  2 +-
 drivers/w1/slaves/w1_ds2433.c  | 10 ++++----
 drivers/w1/slaves/w1_ds2760.c  | 11 ++++----
 drivers/w1/slaves/w1_ds2780.c  |  2 +-
 drivers/w1/slaves/w1_ds2781.c  |  2 +-
 drivers/w1/slaves/w1_ds28e04.c | 10 ++++----
 drivers/w1/slaves/w1_smem.c    | 12 ++++-----
 drivers/w1/slaves/w1_therm.c   | 18 ++++++-------
 drivers/w1/w1.c                | 18 +++++++------
 drivers/w1/w1_family.c         |  5 ++--
 drivers/w1/w1_int.c            |  3 +--
 20 files changed, 138 insertions(+), 170 deletions(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index 2e30db1b1a43..e8730ea3e3aa 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -35,6 +35,8 @@
  */
 static int ds2482_active_pullup = 1;
 module_param_named(active_pullup, ds2482_active_pullup, int, 0644);
+MODULE_PARM_DESC(active_pullup, "Active pullup (apply to all buses): " \
+				"0-disable, 1-enable (default)");
 
 /**
  * The DS2482 registers - there are 3 registers that are addressed by a read
@@ -93,30 +95,6 @@ static const u8 ds2482_chan_rd[8]  #define DS2482_REG_STS_PPD		0x02
 #define DS2482_REG_STS_1WB		0x01
 
-
-static int ds2482_probe(struct i2c_client *client,
-			const struct i2c_device_id *id);
-static int ds2482_remove(struct i2c_client *client);
-
-
-/**
- * Driver data (common to all clients)
- */
-static const struct i2c_device_id ds2482_id[] = {
-	{ "ds2482", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, ds2482_id);
-
-static struct i2c_driver ds2482_driver = {
-	.driver = {
-		.name	= "ds2482",
-	},
-	.probe		= ds2482_probe,
-	.remove		= ds2482_remove,
-	.id_table	= ds2482_id,
-};
-
 /*
  * Client data (each client gets its own)
  */
@@ -560,10 +538,25 @@ static int ds2482_remove(struct i2c_client *client)
 	return 0;
 }
 
+/**
+ * Driver data (common to all clients)
+ */
+static const struct i2c_device_id ds2482_id[] = {
+	{ "ds2482", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ds2482_id);
+
+static struct i2c_driver ds2482_driver = {
+	.driver = {
+		.name	= "ds2482",
+	},
+	.probe		= ds2482_probe,
+	.remove		= ds2482_remove,
+	.id_table	= ds2482_id,
+};
 module_i2c_driver(ds2482_driver);
 
-MODULE_PARM_DESC(active_pullup, "Active pullup (apply to all buses): " \
-				"0-disable, 1-enable (default)");
 MODULE_AUTHOR("Ben Gardner <bgardner@wabtec.com>");
 MODULE_DESCRIPTION("DS2482 driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/w1/masters/ds2490.c b/drivers/w1/masters/ds2490.c
index be77b7914fad..d748e34d4ce5 100644
--- a/drivers/w1/masters/ds2490.c
+++ b/drivers/w1/masters/ds2490.c
@@ -179,28 +179,9 @@ struct ds_status
 	u8			reserved2;
 };
 
-static struct usb_device_id ds_id_table [] = {
-	{ USB_DEVICE(0x04fa, 0x2490) },
-	{ },
-};
-MODULE_DEVICE_TABLE(usb, ds_id_table);
-
-static int ds_probe(struct usb_interface *, const struct usb_device_id *);
-static void ds_disconnect(struct usb_interface *);
-
-static int ds_send_control(struct ds_device *, u16, u16);
-static int ds_send_control_cmd(struct ds_device *, u16, u16);
-
 static LIST_HEAD(ds_devices);
 static DEFINE_MUTEX(ds_mutex);
 
-static struct usb_driver ds_driver = {
-	.name =		"DS9490R",
-	.probe =	ds_probe,
-	.disconnect =	ds_disconnect,
-	.id_table =	ds_id_table,
-};
-
 static int ds_send_control_cmd(struct ds_device *dev, u16 value, u16 index)
 {
 	int err;
@@ -1108,8 +1089,20 @@ static void ds_disconnect(struct usb_interface *intf)
 	kfree(dev);
 }
 
+static struct usb_device_id ds_id_table [] = {
+	{ USB_DEVICE(0x04fa, 0x2490) },
+	{ },
+};
+MODULE_DEVICE_TABLE(usb, ds_id_table);
+
+static struct usb_driver ds_driver = {
+	.name =		"DS9490R",
+	.probe =	ds_probe,
+	.disconnect =	ds_disconnect,
+	.id_table =	ds_id_table,
+};
 module_usb_driver(ds_driver);
 
-MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
 MODULE_DESCRIPTION("DS2490 USB <-> W1 bus master driver (DS9490*)");
+MODULE_LICENSE("GPL");
diff --git a/drivers/w1/masters/matrox_w1.c b/drivers/w1/masters/matrox_w1.c
index 3749db8b4396..cbdf4c9d895c 100644
--- a/drivers/w1/masters/matrox_w1.c
+++ b/drivers/w1/masters/matrox_w1.c
@@ -38,26 +38,6 @@
 #include "../w1_int.h"
 #include "../w1_log.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
-MODULE_DESCRIPTION("Driver for transport(Dallas 1-wire protocol) over VGA DDC(matrox gpio).");
-
-static struct pci_device_id matrox_w1_tbl[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_G400) },
-	{ },
-};
-MODULE_DEVICE_TABLE(pci, matrox_w1_tbl);
-
-static int matrox_w1_probe(struct pci_dev *, const struct pci_device_id *);
-static void matrox_w1_remove(struct pci_dev *);
-
-static struct pci_driver matrox_w1_pci_driver = {
-	.name = "matrox_w1",
-	.id_table = matrox_w1_tbl,
-	.probe = matrox_w1_probe,
-	.remove = matrox_w1_remove,
-};
-
 /*
  * Matrox G400 DDC registers.
  */
@@ -89,9 +69,6 @@ struct matrox_device
 	struct w1_bus_master *bus_master;
 };
 
-static u8 matrox_w1_read_ddc_bit(void *);
-static void matrox_w1_write_ddc_bit(void *, u8);
-
 /*
  * These functions read and write DDC Data bit.
  *
@@ -232,4 +209,21 @@ static void matrox_w1_remove(struct pci_dev *pdev)
 	}
 	kfree(dev);
 }
+
+static struct pci_device_id matrox_w1_tbl[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_MATROX, PCI_DEVICE_ID_MATROX_G400) },
+	{ },
+};
+MODULE_DEVICE_TABLE(pci, matrox_w1_tbl);
+
+static struct pci_driver matrox_w1_pci_driver = {
+	.name = "matrox_w1",
+	.id_table = matrox_w1_tbl,
+	.probe = matrox_w1_probe,
+	.remove = matrox_w1_remove,
+};
 module_pci_driver(matrox_w1_pci_driver);
+
+MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
+MODULE_DESCRIPTION("Driver for transport(Dallas 1-wire protocol) over VGA DDC(matrox gpio).");
+MODULE_LICENSE("GPL");
diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index fb190c259607..3302cbd2344a 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -53,7 +53,10 @@
 #define OMAP_HDQ_MAX_USER			4
 
 static DECLARE_WAIT_QUEUE_HEAD(hdq_wait_queue);
+
 static int w1_id;
+module_param(w1_id, int, S_IRUSR);
+MODULE_PARM_DESC(w1_id, "1-wire id for the slave detection in HDQ mode");
 
 struct hdq_data {
 	struct device		*dev;
@@ -76,36 +79,6 @@ struct hdq_data {
 
 };
 
-static int omap_hdq_probe(struct platform_device *pdev);
-static int omap_hdq_remove(struct platform_device *pdev);
-
-static const struct of_device_id omap_hdq_dt_ids[] = {
-	{ .compatible = "ti,omap3-1w" },
-	{ .compatible = "ti,am4372-hdq" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, omap_hdq_dt_ids);
-
-static struct platform_driver omap_hdq_driver = {
-	.probe =	omap_hdq_probe,
-	.remove =	omap_hdq_remove,
-	.driver =	{
-		.name =	"omap_hdq",
-		.of_match_table = omap_hdq_dt_ids,
-	},
-};
-
-static u8 omap_w1_read_byte(void *_hdq);
-static void omap_w1_write_byte(void *_hdq, u8 byte);
-static u8 omap_w1_reset_bus(void *_hdq);
-
-
-static struct w1_bus_master omap_w1_master = {
-	.read_byte	= omap_w1_read_byte,
-	.write_byte	= omap_w1_write_byte,
-	.reset_bus	= omap_w1_reset_bus,
-};
-
 /* HDQ register I/O routines */
 static inline u8 hdq_reg_in(struct hdq_data *hdq_data, u32 offset)
 {
@@ -678,6 +651,12 @@ static void omap_w1_write_byte(void *_hdq, u8 byte)
 	}
 }
 
+static struct w1_bus_master omap_w1_master = {
+	.read_byte	= omap_w1_read_byte,
+	.write_byte	= omap_w1_write_byte,
+	.reset_bus	= omap_w1_reset_bus,
+};
+
 static int omap_hdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -787,10 +766,22 @@ static int omap_hdq_remove(struct platform_device *pdev)
 	return 0;
 }
 
-module_platform_driver(omap_hdq_driver);
+static const struct of_device_id omap_hdq_dt_ids[] = {
+	{ .compatible = "ti,omap3-1w" },
+	{ .compatible = "ti,am4372-hdq" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, omap_hdq_dt_ids);
 
-module_param(w1_id, int, S_IRUSR);
-MODULE_PARM_DESC(w1_id, "1-wire id for the slave detection in HDQ mode");
+static struct platform_driver omap_hdq_driver = {
+	.probe = omap_hdq_probe,
+	.remove = omap_hdq_remove,
+	.driver = {
+		.name =	"omap_hdq",
+		.of_match_table = omap_hdq_dt_ids,
+	},
+};
+module_platform_driver(omap_hdq_driver);
 
 MODULE_AUTHOR("Texas Instruments");
 MODULE_DESCRIPTION("HDQ-1W driver Library");
diff --git a/drivers/w1/slaves/w1_bq27000.c b/drivers/w1/slaves/w1_bq27000.c
index 9f4a86b754ba..d480900a28ab 100644
--- a/drivers/w1/slaves/w1_bq27000.c
+++ b/drivers/w1/slaves/w1_bq27000.c
@@ -25,6 +25,8 @@
 #define HDQ_CMD_WRITE	(1<<7)
 
 static int F_ID;
+module_param(F_ID, int, S_IRUSR);
+MODULE_PARM_DESC(F_ID, "1-wire slave FID for BQ device");
 
 static int w1_bq27000_read(struct device *dev, unsigned int reg)
 {
@@ -106,13 +108,10 @@ static void __exit w1_bq27000_exit(void)
 	w1_unregister_family(&w1_bq27000_family);
 }
 
-
 module_init(w1_bq27000_init);
 module_exit(w1_bq27000_exit);
 
-module_param(F_ID, int, S_IRUSR);
-MODULE_PARM_DESC(F_ID, "1-wire slave FID for BQ device");
-MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_BQ27000));
-MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Texas Instruments Ltd");
 MODULE_DESCRIPTION("HDQ/1-wire slave driver bq27000 battery monitor chip");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_BQ27000));
diff --git a/drivers/w1/slaves/w1_ds2406.c b/drivers/w1/slaves/w1_ds2406.c
index 51f2f66d6555..709bd5e02eed 100644
--- a/drivers/w1/slaves/w1_ds2406.c
+++ b/drivers/w1/slaves/w1_ds2406.c
@@ -21,10 +21,6 @@
 #include "../w1_int.h"
 #include "../w1_family.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Scott Alfter <scott@alfter.us>");
-MODULE_DESCRIPTION("w1 family 12 driver for DS2406 2 Pin IO");
-
 #define W1_F12_FUNC_READ_STATUS		   0xAA
 #define W1_F12_FUNC_WRITE_STATUS	   0x55
 
@@ -154,3 +150,7 @@ static struct w1_family w1_family_12 = {
 	.fops = &w1_f12_fops,
 };
 module_w1_family(w1_family_12);
+
+MODULE_AUTHOR("Scott Alfter <scott@alfter.us>");
+MODULE_DESCRIPTION("w1 family 12 driver for DS2406 2 Pin IO");
+MODULE_LICENSE("GPL");
diff --git a/drivers/w1/slaves/w1_ds2408.c b/drivers/w1/slaves/w1_ds2408.c
index aec5958e66e9..e01d2b3997bc 100644
--- a/drivers/w1/slaves/w1_ds2408.c
+++ b/drivers/w1/slaves/w1_ds2408.c
@@ -19,12 +19,6 @@
 #include "../w1_int.h"
 #include "../w1_family.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Jean-Francois Dagenais <dagenaisj@sonatest.com>");
-MODULE_DESCRIPTION("w1 family 29 driver for DS2408 8 Pin IO");
-MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS2408));
-
-
 #define W1_F29_RETRIES		3
 
 #define W1_F29_REG_LOGIG_STATE             0x88 /* R */
@@ -352,3 +346,8 @@ static struct w1_family w1_family_29 = {
 	.fops = &w1_f29_fops,
 };
 module_w1_family(w1_family_29);
+
+MODULE_AUTHOR("Jean-Francois Dagenais <dagenaisj@sonatest.com>");
+MODULE_DESCRIPTION("w1 family 29 driver for DS2408 8 Pin IO");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS2408));
diff --git a/drivers/w1/slaves/w1_ds2413.c b/drivers/w1/slaves/w1_ds2413.c
index f2e1c51533b9..9cc6f0bc2e95 100644
--- a/drivers/w1/slaves/w1_ds2413.c
+++ b/drivers/w1/slaves/w1_ds2413.c
@@ -20,11 +20,6 @@
 #include "../w1_int.h"
 #include "../w1_family.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Mariusz Bialonczyk <manio@skyboo.net>");
-MODULE_DESCRIPTION("w1 family 3a driver for DS2413 2 Pin IO");
-MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS2413));
-
 #define W1_F3A_RETRIES                     3
 #define W1_F3A_FUNC_PIO_ACCESS_READ        0xF5
 #define W1_F3A_FUNC_PIO_ACCESS_WRITE       0x5A
@@ -136,3 +131,8 @@ static struct w1_family w1_family_3a = {
 	.fops = &w1_f3a_fops,
 };
 module_w1_family(w1_family_3a);
+
+MODULE_AUTHOR("Mariusz Bialonczyk <manio@skyboo.net>");
+MODULE_DESCRIPTION("w1 family 3a driver for DS2413 2 Pin IO");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS2413));
diff --git a/drivers/w1/slaves/w1_ds2423.c b/drivers/w1/slaves/w1_ds2423.c
index 4ab54fd9dde2..306240fe496c 100644
--- a/drivers/w1/slaves/w1_ds2423.c
+++ b/drivers/w1/slaves/w1_ds2423.c
@@ -140,7 +140,7 @@ static struct w1_family w1_family_1d = {
 };
 module_w1_family(w1_family_1d);
 
-MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mika Laitio <lamikr@pilppa.org>");
 MODULE_DESCRIPTION("w1 family 1d driver for DS2423, 4 counters and 4kb ram");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("w1-family-" __stringify(W1_COUNTER_DS2423));
diff --git a/drivers/w1/slaves/w1_ds2431.c b/drivers/w1/slaves/w1_ds2431.c
index 80572cb63ba8..20182d4a4b19 100644
--- a/drivers/w1/slaves/w1_ds2431.c
+++ b/drivers/w1/slaves/w1_ds2431.c
@@ -290,7 +290,7 @@ static struct w1_family w1_family_2d = {
 };
 module_w1_family(w1_family_2d);
 
-MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Bernhard Weirich <bernhard.weirich@riedel.net>");
 MODULE_DESCRIPTION("w1 family 2d driver for DS2431, 1kb EEPROM");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("w1-family-" __stringify(W1_EEPROM_DS2431));
diff --git a/drivers/w1/slaves/w1_ds2433.c b/drivers/w1/slaves/w1_ds2433.c
index 6cf378c89ecb..86c30aceea3e 100644
--- a/drivers/w1/slaves/w1_ds2433.c
+++ b/drivers/w1/slaves/w1_ds2433.c
@@ -26,11 +26,6 @@
 #include "../w1_int.h"
 #include "../w1_family.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Ben Gardner <bgardner@wabtec.com>");
-MODULE_DESCRIPTION("w1 family 23 driver for DS2433, 4kb EEPROM");
-MODULE_ALIAS("w1-family-" __stringify(W1_EEPROM_DS2433));
-
 #define W1_EEPROM_SIZE		512
 #define W1_PAGE_COUNT		16
 #define W1_PAGE_SIZE		32
@@ -306,3 +301,8 @@ static struct w1_family w1_family_23 = {
 	.fops = &w1_f23_fops,
 };
 module_w1_family(w1_family_23);
+
+MODULE_AUTHOR("Ben Gardner <bgardner@wabtec.com>");
+MODULE_DESCRIPTION("w1 family 23 driver for DS2433, 4kb EEPROM");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("w1-family-" __stringify(W1_EEPROM_DS2433));
diff --git a/drivers/w1/slaves/w1_ds2760.c b/drivers/w1/slaves/w1_ds2760.c
index ffa37f773b3b..f35d1e2ef9bb 100644
--- a/drivers/w1/slaves/w1_ds2760.c
+++ b/drivers/w1/slaves/w1_ds2760.c
@@ -63,11 +63,13 @@ int w1_ds2760_read(struct device *dev, char *buf, int addr, size_t count)
 {
 	return w1_ds2760_io(dev, buf, addr, count, 0);
 }
+EXPORT_SYMBOL(w1_ds2760_read);
 
 int w1_ds2760_write(struct device *dev, char *buf, int addr, size_t count)
 {
 	return w1_ds2760_io(dev, buf, addr, count, 1);
 }
+EXPORT_SYMBOL(w1_ds2760_write);
 
 static int w1_ds2760_eeprom_cmd(struct device *dev, int addr, int cmd)
 {
@@ -91,11 +93,13 @@ int w1_ds2760_store_eeprom(struct device *dev, int addr)
 {
 	return w1_ds2760_eeprom_cmd(dev, addr, W1_DS2760_COPY_DATA);
 }
+EXPORT_SYMBOL(w1_ds2760_store_eeprom);
 
 int w1_ds2760_recall_eeprom(struct device *dev, int addr)
 {
 	return w1_ds2760_eeprom_cmd(dev, addr, W1_DS2760_RECALL_DATA);
 }
+EXPORT_SYMBOL(w1_ds2760_recall_eeprom);
 
 static ssize_t w1_slave_read(struct file *filp, struct kobject *kobj,
 			     struct bin_attribute *bin_attr, char *buf,
@@ -164,12 +168,7 @@ static struct w1_family w1_ds2760_family = {
 };
 module_w1_family(w1_ds2760_family);
 
-EXPORT_SYMBOL(w1_ds2760_read);
-EXPORT_SYMBOL(w1_ds2760_write);
-EXPORT_SYMBOL(w1_ds2760_store_eeprom);
-EXPORT_SYMBOL(w1_ds2760_recall_eeprom);
-
-MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Szabolcs Gyurko <szabolcs.gyurko@tlt.hu>");
 MODULE_DESCRIPTION("1-wire Driver Dallas 2760 battery monitor chip");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS2760));
diff --git a/drivers/w1/slaves/w1_ds2780.c b/drivers/w1/slaves/w1_ds2780.c
index f5c2aa429a92..292972212107 100644
--- a/drivers/w1/slaves/w1_ds2780.c
+++ b/drivers/w1/slaves/w1_ds2780.c
@@ -156,7 +156,7 @@ static struct w1_family w1_ds2780_family = {
 };
 module_w1_family(w1_ds2780_family);
 
-MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Clifton Barnes <cabarnes@indesign-llc.com>");
 MODULE_DESCRIPTION("1-wire Driver for Maxim/Dallas DS2780 Stand-Alone Fuel Gauge IC");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS2780));
diff --git a/drivers/w1/slaves/w1_ds2781.c b/drivers/w1/slaves/w1_ds2781.c
index 9c03e014cf9e..a5d75067b230 100644
--- a/drivers/w1/slaves/w1_ds2781.c
+++ b/drivers/w1/slaves/w1_ds2781.c
@@ -153,7 +153,7 @@ static struct w1_family w1_ds2781_family = {
 };
 module_w1_family(w1_ds2781_family);
 
-MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Renata Sayakhova <renata@oktetlabs.ru>");
 MODULE_DESCRIPTION("1-wire Driver for Maxim/Dallas DS2781 Stand-Alone Fuel Gauge IC");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS2781));
diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
index 5e348d38ec5c..c62858c05e8f 100644
--- a/drivers/w1/slaves/w1_ds28e04.c
+++ b/drivers/w1/slaves/w1_ds28e04.c
@@ -24,11 +24,6 @@
 #include "../w1_int.h"
 #include "../w1_family.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Markus Franke <franke.m@sebakmt.com>, <franm@hrz.tu-chemnitz.de>");
-MODULE_DESCRIPTION("w1 family 1C driver for DS28E04, 4kb EEPROM and PIO");
-MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS28E04));
-
 /* Allow the strong pullup to be disabled, but default to enabled.
  * If it was disabled a parasite powered device might not get the required
  * current to copy the data from the scratchpad to EEPROM.  If it is enabled
@@ -428,3 +423,8 @@ static struct w1_family w1_family_1C = {
 	.fops = &w1_f1C_fops,
 };
 module_w1_family(w1_family_1C);
+
+MODULE_AUTHOR("Markus Franke <franke.m@sebakmt.com>, <franm@hrz.tu-chemnitz.de>");
+MODULE_DESCRIPTION("w1 family 1C driver for DS28E04, 4kb EEPROM and PIO");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_DS28E04));
diff --git a/drivers/w1/slaves/w1_smem.c b/drivers/w1/slaves/w1_smem.c
index ed4c87506def..99b03bfb9941 100644
--- a/drivers/w1/slaves/w1_smem.c
+++ b/drivers/w1/slaves/w1_smem.c
@@ -31,12 +31,6 @@
 #include "../w1_int.h"
 #include "../w1_family.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
-MODULE_DESCRIPTION("Driver for 1-wire Dallas network protocol, 64bit memory family.");
-MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_SMEM_01));
-MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_SMEM_81));
-
 static struct w1_family w1_smem_family_01 = {
 	.fid = W1_FAMILY_SMEM_01,
 };
@@ -70,3 +64,9 @@ static void __exit w1_smem_fini(void)
 
 module_init(w1_smem_init);
 module_exit(w1_smem_fini);
+
+MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
+MODULE_DESCRIPTION("Driver for 1-wire Dallas network protocol, 64bit memory family.");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_SMEM_01));
+MODULE_ALIAS("w1-family-" __stringify(W1_FAMILY_SMEM_81));
diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
index 82611f197b0a..ccaf29994a42 100644
--- a/drivers/w1/slaves/w1_therm.c
+++ b/drivers/w1/slaves/w1_therm.c
@@ -34,15 +34,6 @@
 #include "../w1_int.h"
 #include "../w1_family.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
-MODULE_DESCRIPTION("Driver for 1-wire Dallas network protocol, temperature family.");
-MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS18S20));
-MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS1822));
-MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS18B20));
-MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS1825));
-MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS28EA00));
-
 /* Allow the strong pullup to be disabled, but default to enabled.
  * If it was disabled a parasite powered device might not get the require
  * current to do a temperature conversion.  If it is enabled parasite powered
@@ -646,3 +637,12 @@ static void __exit w1_therm_fini(void)
 
 module_init(w1_therm_init);
 module_exit(w1_therm_fini);
+
+MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
+MODULE_DESCRIPTION("Driver for 1-wire Dallas network protocol, temperature family.");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS18S20));
+MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS1822));
+MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS18B20));
+MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS1825));
+MODULE_ALIAS("w1-family-" __stringify(W1_THERM_DS28EA00));
diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 90a3d9338fd2..281abfd369b8 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -34,20 +34,15 @@
 #include "w1_family.h"
 #include "w1_netlink.h"
 
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
-MODULE_DESCRIPTION("Driver for 1-wire Dallas network protocol.");
-
 static int w1_timeout = 10;
-static int w1_timeout_us = 0;
-int w1_max_slave_count = 64;
-int w1_max_slave_ttl = 10;
-
 module_param_named(timeout, w1_timeout, int, 0);
 MODULE_PARM_DESC(timeout, "time in seconds between automatic slave searches");
+
+static int w1_timeout_us = 0;
 module_param_named(timeout_us, w1_timeout_us, int, 0);
 MODULE_PARM_DESC(timeout_us,
 		 "time in microseconds between automatic slave searches");
+
 /* A search stops when w1_max_slave_count devices have been found in that
  * search.  The next search will start over and detect the same set of devices
  * on a static 1-wire bus.  Memory is not allocated based on this number, just
@@ -56,9 +51,12 @@ MODULE_PARM_DESC(timeout_us,
  * device on the network and w1_max_slave_count is set to 1, the device id can
  * be read directly skipping the normal slower search process.
  */
+int w1_max_slave_count = 64;
 module_param_named(max_slave_count, w1_max_slave_count, int, 0);
 MODULE_PARM_DESC(max_slave_count,
 	"maximum number of slaves detected in a search");
+
+int w1_max_slave_ttl = 10;
 module_param_named(slave_ttl, w1_max_slave_ttl, int, 0);
 MODULE_PARM_DESC(slave_ttl,
 	"Number of searches not seeing a slave before it will be removed");
@@ -1229,3 +1227,7 @@ static void __exit w1_fini(void)
 
 module_init(w1_init);
 module_exit(w1_fini);
+
+MODULE_AUTHOR("Evgeniy Polyakov <zbr@ioremap.net>");
+MODULE_DESCRIPTION("Driver for 1-wire Dallas network protocol.");
+MODULE_LICENSE("GPL");
diff --git a/drivers/w1/w1_family.c b/drivers/w1/w1_family.c
index 2096f460498f..9759cdaf22f4 100644
--- a/drivers/w1/w1_family.c
+++ b/drivers/w1/w1_family.c
@@ -55,6 +55,7 @@ int w1_register_family(struct w1_family *newf)
 
 	return ret;
 }
+EXPORT_SYMBOL(w1_register_family);
 
 /**
  * w1_unregister_family() - unregister a device family driver
@@ -87,6 +88,7 @@ void w1_unregister_family(struct w1_family *fent)
 			flush_signals(current);
 	}
 }
+EXPORT_SYMBOL(w1_unregister_family);
 
 /*
  * Should be called under w1_flock held.
@@ -136,6 +138,3 @@ void __w1_family_get(struct w1_family *f)
 	atomic_inc(&f->refcnt);
 	smp_mb__after_atomic();
 }
-
-EXPORT_SYMBOL(w1_unregister_family);
-EXPORT_SYMBOL(w1_register_family);
diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
index 2cae7b29bb5f..0a3b1ea25765 100644
--- a/drivers/w1/w1_int.c
+++ b/drivers/w1/w1_int.c
@@ -180,6 +180,7 @@ int w1_add_master_device(struct w1_bus_master *master)
 
 	return retval;
 }
+EXPORT_SYMBOL(w1_add_master_device);
 
 void __w1_remove_master_device(struct w1_master *dev)
 {
@@ -252,6 +253,4 @@ void w1_remove_master_device(struct w1_bus_master *bm)
 
 	__w1_remove_master_device(found);
 }
-
-EXPORT_SYMBOL(w1_add_master_device);
 EXPORT_SYMBOL(w1_remove_master_device);
-- 
2.11.0

