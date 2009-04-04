From: Martin Olsson <mnemo@minimum.se>
Date: Sat, 04 Apr 2009 10:49:54 +0000
Subject: [PATCH 2/2] Fix paramater/parameter typo in dmesg and source comments
Message-Id: <49D73B52.5050508@minimum.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060500020800010600090208"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060500020800010600090208
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

 From edef040c17106bb02431b9399e9b214da8d7a5fd Mon Sep 17 00:00:00 2001
From: Martin Olsson <martin@minimum.se>
Date: Sat, 4 Apr 2009 12:29:59 +0200
Subject: [PATCH] Correctly spell the word "parameter" in various source comments.

Signed-off-by: Martin Olsson <martin@minimum.se>
---
  drivers/atm/lanai.c                    |    2 +-
  drivers/input/joystick/xpad.c          |    2 +-
  drivers/net/b44.c                      |    2 +-
  drivers/net/smc-mca.c                  |    2 +-
  drivers/net/wireless/orinoco/orinoco.h |    2 +-
  drivers/net/wireless/p54/p54spi.c      |    2 +-
  drivers/scsi/qla1280.c                 |    2 +-
  drivers/scsi/qla4xxx/ql4_mbx.c         |    2 +-
  drivers/staging/epl/EplInstDef.h       |    2 +-
  drivers/staging/rt2860/rt28xx.h        |    2 +-
  drivers/staging/rt2870/rt28xx.h        |    2 +-
  drivers/usb/core/message.c             |    4 ++--
  drivers/usb/serial/io_edgeport.c       |    2 +-
  drivers/usb/serial/ir-usb.c            |    2 +-
  drivers/video/controlfb.c              |    2 +-
  fs/debugfs/inode.c                     |    6 +++---
  16 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 8733a2e..df6753e 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -66,7 +66,7 @@
  #include <linux/delay.h>
  #include <linux/interrupt.h>

-/* -------------------- TUNABLE PARAMATERS: */
+/* -------------------- TUNABLE PARAMETERS: */

  /*
   * Maximum number of VCIs per card.  Setting it lower could theoretically
diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index b868b8d..32dfada 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -66,7 +66,7 @@
   *  - borrowed from the XBOX linux kernel
   *  - USB id's for commonly used dance pads are present
   *  - dance pads will map D-PAD to buttons, not axes
- *  - pass the module paramater 'dpad_to_buttons' to force
+ *  - pass the module parameter 'dpad_to_buttons' to force
   *    the D-PAD to map to buttons if your pad is not detected
   *
   * Later changes can be tracked in SCM.
diff --git a/drivers/net/b44.c b/drivers/net/b44.c
index 5c84541..230c13c 100644
--- a/drivers/net/b44.c
+++ b/drivers/net/b44.c
@@ -2343,7 +2343,7 @@ static int __init b44_init(void)
  	unsigned int dma_desc_align_size = dma_get_cache_alignment();
  	int err;

-	/* Setup paramaters for syncing RX/TX DMA descriptors */
+	/* Setup parameters for syncing RX/TX DMA descriptors */
  	dma_desc_align_mask = ~(dma_desc_align_size - 1);
  	dma_desc_sync_size = max_t(unsigned int, dma_desc_align_size, sizeof(struct dma_desc));

diff --git a/drivers/net/smc-mca.c b/drivers/net/smc-mca.c
index 8d36d40..568658e 100644
--- a/drivers/net/smc-mca.c
+++ b/drivers/net/smc-mca.c
@@ -240,7 +240,7 @@ static int __init ultramca_probe(struct device *gen_dev)
  	/* Test the following conditions:
  	 * - If an irq parameter is supplied, compare it
  	 *   with the irq of the adapter we found
-	 * - If a base_addr paramater is given, compare it
+	 * - If a base_addr parameter is given, compare it
  	 *   with the base_addr of the adapter we found
  	 * - Check that the irq and the base_addr of the
  	 *   adapter we found is not already in use by
diff --git a/drivers/net/wireless/orinoco/orinoco.h b/drivers/net/wireless/orinoco/orinoco.h
index 8e5a72c..5df7837 100644
--- a/drivers/net/wireless/orinoco/orinoco.h
+++ b/drivers/net/wireless/orinoco/orinoco.h
@@ -115,7 +115,7 @@ struct orinoco_private {
  	unsigned int broken_disableport:1;
  	unsigned int broken_monitor:1;

-	/* Configuration paramaters */
+	/* Configuration parameters */
  	u32 iw_mode;
  	int prefer_port3;
  	u16 encode_alg, wep_restrict, tx_key;
diff --git a/drivers/net/wireless/p54/p54spi.c b/drivers/net/wireless/p54/p54spi.c
index 2b222aa..b83a7b4 100644
--- a/drivers/net/wireless/p54/p54spi.c
+++ b/drivers/net/wireless/p54/p54spi.c
@@ -42,7 +42,7 @@ MODULE_ALIAS("stlc45xx");
  /*
   * gpios should be handled in board files and provided via platform data,
   * but because it's currently impossible for p54spi to have a header file
- * in include/linux, let's use module paramaters for now
+ * in include/linux, let's use module parameters for now
   */

  static int p54spi_gpio_power = 97;
diff --git a/drivers/scsi/qla1280.c b/drivers/scsi/qla1280.c
index df09820..a1fc449 100644
--- a/drivers/scsi/qla1280.c
+++ b/drivers/scsi/qla1280.c
@@ -4326,7 +4326,7 @@ qla1280_probe_one(struct pci_dev *pdev, const struct pci_device_id *id)
  		goto error_release_region;
  	}

-	/* load the F/W, read paramaters, and init the H/W */
+	/* load the F/W, read parameters, and init the H/W */
  	if (qla1280_initialize_adapter(ha)) {
  		printk(KERN_INFO "qla1x160: Failed to initialize adapter\n");
  		goto error_free_irq;
diff --git a/drivers/scsi/qla4xxx/ql4_mbx.c b/drivers/scsi/qla4xxx/ql4_mbx.c
index 051b0f5..cd18028 100644
--- a/drivers/scsi/qla4xxx/ql4_mbx.c
+++ b/drivers/scsi/qla4xxx/ql4_mbx.c
@@ -250,7 +250,7 @@ int qla4xxx_initialize_fw_cb(struct scsi_qla_host * ha)
  	/*memcpy(ha->alias, init_fw_cb->Alias,
  	       min(sizeof(ha->alias), sizeof(init_fw_cb->Alias)));*/

-	/* Save Command Line Paramater info */
+	/* Save Command Line Parameter info */
  	ha->port_down_retry_count = le16_to_cpu(init_fw_cb->pri.conn_ka_timeout);
  	ha->discovery_wait = ql4xdiscoverywait;

diff --git a/drivers/staging/epl/EplInstDef.h b/drivers/staging/epl/EplInstDef.h
index 89efbf2..1f2fd2e 100644
--- a/drivers/staging/epl/EplInstDef.h
+++ b/drivers/staging/epl/EplInstDef.h
@@ -163,7 +163,7 @@ typedef BYTE tEplInstanceHdl;
      //--------------------------------------------------------------------------------------

      // macros for declaration within the function header, prototype or local var list
-    // Declaration of pointers within function paramater list must defined as void MEM*
+    // Declaration of pointers within function parameter list must defined as void MEM*
      // pointer.
  #define EPL_MCO_DECL_INSTANCE_PTR                   void MEM* pInstance
  #define EPL_MCO_DECL_INSTANCE_PTR_                  void MEM* pInstance,
diff --git a/drivers/staging/rt2860/rt28xx.h b/drivers/staging/rt2860/rt28xx.h
index ff23043..eefc7db 100644
--- a/drivers/staging/rt2860/rt28xx.h
+++ b/drivers/staging/rt2860/rt28xx.h
@@ -1063,7 +1063,7 @@ typedef	union	_LG_FBK_CFG1_STRUC	{
  #endif

  //=======================================================
-//================ Protection Paramater================================
+//================ Protection Parameter================================
  //=======================================================
  #define CCK_PROT_CFG	0x1364		//CCK Protection
  #define ASIC_SHORTNAV		1
diff --git a/drivers/staging/rt2870/rt28xx.h b/drivers/staging/rt2870/rt28xx.h
index 3927d22..9a9b708 100644
--- a/drivers/staging/rt2870/rt28xx.h
+++ b/drivers/staging/rt2870/rt28xx.h
@@ -1063,7 +1063,7 @@ typedef	union	_LG_FBK_CFG1_STRUC	{
  #endif

  //=======================================================
-//================ Protection Paramater================================
+//================ Protection Parameter================================
  //=======================================================
  #define CCK_PROT_CFG	0x1364		//CCK Protection
  #define ASIC_SHORTNAV		1
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 30a0690..435e43e 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -172,7 +172,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg);
   * waits for the message to complete, or timeout.
   *
   * If successful, it returns 0, otherwise a negative error number.  The number
- * of actual bytes transferred will be stored in the actual_length paramater.
+ * of actual bytes transferred will be stored in the actual_length parameter.
   *
   * Don't use this function from within an interrupt context, like a bottom half
   * handler.  If you need an asynchronous message, or need to send a message
@@ -205,7 +205,7 @@ EXPORT_SYMBOL_GPL(usb_interrupt_msg);
   * and waits for the message to complete, or timeout.
   *
   * If successful, it returns 0, otherwise a negative error number.  The number
- * of actual bytes transferred will be stored in the actual_length paramater.
+ * of actual bytes transferred will be stored in the actual_length parameter.
   *
   * Don't use this function from within an interrupt context, like a bottom half
   * handler.  If you need an asynchronous message, or need to send a message
diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index e85c8c0..a242ef5 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -151,7 +151,7 @@ struct edgeport_serial {
  	__u8			rxHeader3;			/* receive header byte 3 */
  	__u8			rxPort;				/* the port that we are currently receiving data for */
  	__u8			rxStatusCode;			/* the receive status code */
-	__u8			rxStatusParam;			/* the receive status paramater */
+	__u8			rxStatusParam;			/* the receive status parameter */
  	__s16			rxBytesRemaining;		/* the number of port bytes left to read */
  	struct usb_serial	*serial;			/* loop back to the owner of this object */
  };
diff --git a/drivers/usb/serial/ir-usb.c b/drivers/usb/serial/ir-usb.c
index 4e2cda9..bf4e2f3 100644
--- a/drivers/usb/serial/ir-usb.c
+++ b/drivers/usb/serial/ir-usb.c
@@ -47,7 +47,7 @@
   *
   * 2001_Nov_01	greg kh
   *	Added support for more IrDA USB devices.
- *	Added support for zero packet.  Added buffer override paramater, so
+ *	Added support for zero packet.  Added buffer override parameter, so
   *	users can transfer larger packets at once if they wish.  Both patches
   *	came from Dag Brattli <dag@obexcode.com>.
   *
diff --git a/drivers/video/controlfb.c b/drivers/video/controlfb.c
index 49fcbe8..b8929d3 100644
--- a/drivers/video/controlfb.c
+++ b/drivers/video/controlfb.c
@@ -792,7 +792,7 @@ static int read_control_sense(struct fb_info_control *p)
  #define CONTROL_PIXCLOCK_MIN	5000	/* ~ 200 MHz dot clock */

  /*
- * calculate the clock paramaters to be sent to CUDA according to given
+ * calculate the clock parameters to be sent to CUDA according to given
   * pixclock in pico second.
   */
  static int calc_clock_params(unsigned long clk, unsigned char *param)
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 81ae9ea..9a6f88b 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -185,7 +185,7 @@ static int debugfs_create_by_name(const char *name, mode_t mode,
   * @name: a pointer to a string containing the name of the file to create.
   * @mode: the permission that the file should have
   * @parent: a pointer to the parent dentry for this file.  This should be a
- *          directory dentry if set.  If this paramater is NULL, then the
+ *          directory dentry if set.  If this parameter is NULL, then the
   *          file will be created in the root of the debugfs filesystem.
   * @data: a pointer to something that the caller will want to get to later
   *        on.  The inode.i_private pointer will point to this value on
@@ -243,7 +243,7 @@ EXPORT_SYMBOL_GPL(debugfs_create_file);
   * @name: a pointer to a string containing the name of the directory to
   *        create.
   * @parent: a pointer to the parent dentry for this file.  This should be a
- *          directory dentry if set.  If this paramater is NULL, then the
+ *          directory dentry if set.  If this parameter is NULL, then the
   *          directory will be created in the root of the debugfs filesystem.
   *
   * This function creates a directory in debugfs with the given name.
@@ -269,7 +269,7 @@ EXPORT_SYMBOL_GPL(debugfs_create_dir);
   * @name: a pointer to a string containing the name of the symbolic link to
   *        create.
   * @parent: a pointer to the parent dentry for this symbolic link.  This
- *          should be a directory dentry if set.  If this paramater is NULL,
+ *          should be a directory dentry if set.  If this parameter is NULL,
   *          then the symbolic link will be created in the root of the debugfs
   *          filesystem.
   * @target: a pointer to a string containing the path to the target of the
-- 
1.6.0.4


--------------060500020800010600090208
Content-Type: application/mbox;
 name="0001-Correctly-spell-the-word-parameter-in-various-sour.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename*0="0001-Correctly-spell-the-word-parameter-in-various-sour.patc";
 filename*1="h"

RnJvbSBlZGVmMDQwYzE3MTA2YmIwMjQzMWI5Mzk5ZTliMjE0ZGE4ZDdhNWZkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJ0aW4gT2xzc29uIDxtYXJ0aW5AbWluaW11bS5z
ZT4KRGF0ZTogU2F0LCA0IEFwciAyMDA5IDEyOjI5OjU5ICswMjAwClN1YmplY3Q6IFtQQVRD
SF0gQ29ycmVjdGx5IHNwZWxsIHRoZSB3b3JkICJwYXJhbWV0ZXIiIGluIHZhcmlvdXMgc291
cmNlIGNvbW1lbnRzLgoKU2lnbmVkLW9mZi1ieTogTWFydGluIE9sc3NvbiA8bWFydGluQG1p
bmltdW0uc2U+Ci0tLQogZHJpdmVycy9hdG0vbGFuYWkuYyAgICAgICAgICAgICAgICAgICAg
fCAgICAyICstCiBkcml2ZXJzL2lucHV0L2pveXN0aWNrL3hwYWQuYyAgICAgICAgICB8ICAg
IDIgKy0KIGRyaXZlcnMvbmV0L2I0NC5jICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiAr
LQogZHJpdmVycy9uZXQvc21jLW1jYS5jICAgICAgICAgICAgICAgICAgfCAgICAyICstCiBk
cml2ZXJzL25ldC93aXJlbGVzcy9vcmlub2NvL29yaW5vY28uaCB8ICAgIDIgKy0KIGRyaXZl
cnMvbmV0L3dpcmVsZXNzL3A1NC9wNTRzcGkuYyAgICAgIHwgICAgMiArLQogZHJpdmVycy9z
Y3NpL3FsYTEyODAuYyAgICAgICAgICAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL3Njc2kv
cWxhNHh4eC9xbDRfbWJ4LmMgICAgICAgICB8ICAgIDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9l
cGwvRXBsSW5zdERlZi5oICAgICAgIHwgICAgMiArLQogZHJpdmVycy9zdGFnaW5nL3J0Mjg2
MC9ydDI4eHguaCAgICAgICAgfCAgICAyICstCiBkcml2ZXJzL3N0YWdpbmcvcnQyODcwL3J0
Mjh4eC5oICAgICAgICB8ICAgIDIgKy0KIGRyaXZlcnMvdXNiL2NvcmUvbWVzc2FnZS5jICAg
ICAgICAgICAgIHwgICAgNCArKy0tCiBkcml2ZXJzL3VzYi9zZXJpYWwvaW9fZWRnZXBvcnQu
YyAgICAgICB8ICAgIDIgKy0KIGRyaXZlcnMvdXNiL3NlcmlhbC9pci11c2IuYyAgICAgICAg
ICAgIHwgICAgMiArLQogZHJpdmVycy92aWRlby9jb250cm9sZmIuYyAgICAgICAgICAgICAg
fCAgICAyICstCiBmcy9kZWJ1Z2ZzL2lub2RlLmMgICAgICAgICAgICAgICAgICAgICB8ICAg
IDYgKysrLS0tCiAxNiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxOSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2F0bS9sYW5haS5jIGIvZHJpdmVycy9h
dG0vbGFuYWkuYwppbmRleCA4NzMzYTJlLi5kZjY3NTNlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2F0bS9sYW5haS5jCisrKyBiL2RyaXZlcnMvYXRtL2xhbmFpLmMKQEAgLTY2LDcgKzY2LDcg
QEAKICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgogI2luY2x1ZGUgPGxpbnV4L2ludGVycnVw
dC5oPgogCi0vKiAtLS0tLS0tLS0tLS0tLS0tLS0tLSBUVU5BQkxFIFBBUkFNQVRFUlM6ICov
CisvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLSBUVU5BQkxFIFBBUkFNRVRFUlM6ICovCiAKIC8q
CiAgKiBNYXhpbXVtIG51bWJlciBvZiBWQ0lzIHBlciBjYXJkLiAgU2V0dGluZyBpdCBsb3dl
ciBjb3VsZCB0aGVvcmV0aWNhbGx5CmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2pveXN0
aWNrL3hwYWQuYyBiL2RyaXZlcnMvaW5wdXQvam95c3RpY2sveHBhZC5jCmluZGV4IGI4Njhi
OGQuLjMyZGZhZGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5wdXQvam95c3RpY2sveHBhZC5j
CisrKyBiL2RyaXZlcnMvaW5wdXQvam95c3RpY2sveHBhZC5jCkBAIC02Niw3ICs2Niw3IEBA
CiAgKiAgLSBib3Jyb3dlZCBmcm9tIHRoZSBYQk9YIGxpbnV4IGtlcm5lbAogICogIC0gVVNC
IGlkJ3MgZm9yIGNvbW1vbmx5IHVzZWQgZGFuY2UgcGFkcyBhcmUgcHJlc2VudAogICogIC0g
ZGFuY2UgcGFkcyB3aWxsIG1hcCBELVBBRCB0byBidXR0b25zLCBub3QgYXhlcwotICogIC0g
cGFzcyB0aGUgbW9kdWxlIHBhcmFtYXRlciAnZHBhZF90b19idXR0b25zJyB0byBmb3JjZQor
ICogIC0gcGFzcyB0aGUgbW9kdWxlIHBhcmFtZXRlciAnZHBhZF90b19idXR0b25zJyB0byBm
b3JjZQogICogICAgdGhlIEQtUEFEIHRvIG1hcCB0byBidXR0b25zIGlmIHlvdXIgcGFkIGlz
IG5vdCBkZXRlY3RlZAogICoKICAqIExhdGVyIGNoYW5nZXMgY2FuIGJlIHRyYWNrZWQgaW4g
U0NNLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvYjQ0LmMgYi9kcml2ZXJzL25ldC9iNDQu
YwppbmRleCA1Yzg0NTQxLi4yMzBjMTNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9iNDQu
YworKysgYi9kcml2ZXJzL25ldC9iNDQuYwpAQCAtMjM0Myw3ICsyMzQzLDcgQEAgc3RhdGlj
IGludCBfX2luaXQgYjQ0X2luaXQodm9pZCkKIAl1bnNpZ25lZCBpbnQgZG1hX2Rlc2NfYWxp
Z25fc2l6ZSA9IGRtYV9nZXRfY2FjaGVfYWxpZ25tZW50KCk7CiAJaW50IGVycjsKIAotCS8q
IFNldHVwIHBhcmFtYXRlcnMgZm9yIHN5bmNpbmcgUlgvVFggRE1BIGRlc2NyaXB0b3JzICov
CisJLyogU2V0dXAgcGFyYW1ldGVycyBmb3Igc3luY2luZyBSWC9UWCBETUEgZGVzY3JpcHRv
cnMgKi8KIAlkbWFfZGVzY19hbGlnbl9tYXNrID0gfihkbWFfZGVzY19hbGlnbl9zaXplIC0g
MSk7CiAJZG1hX2Rlc2Nfc3luY19zaXplID0gbWF4X3QodW5zaWduZWQgaW50LCBkbWFfZGVz
Y19hbGlnbl9zaXplLCBzaXplb2Yoc3RydWN0IGRtYV9kZXNjKSk7CiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L3NtYy1tY2EuYyBiL2RyaXZlcnMvbmV0L3NtYy1tY2EuYwppbmRleCA4
ZDM2ZDQwLi41Njg2NThlIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9zbWMtbWNhLmMKKysr
IGIvZHJpdmVycy9uZXQvc21jLW1jYS5jCkBAIC0yNDAsNyArMjQwLDcgQEAgc3RhdGljIGlu
dCBfX2luaXQgdWx0cmFtY2FfcHJvYmUoc3RydWN0IGRldmljZSAqZ2VuX2RldikKIAkvKiBU
ZXN0IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKIAkgKiAtIElmIGFuIGlycSBwYXJhbWV0
ZXIgaXMgc3VwcGxpZWQsIGNvbXBhcmUgaXQKIAkgKiAgIHdpdGggdGhlIGlycSBvZiB0aGUg
YWRhcHRlciB3ZSBmb3VuZAotCSAqIC0gSWYgYSBiYXNlX2FkZHIgcGFyYW1hdGVyIGlzIGdp
dmVuLCBjb21wYXJlIGl0CisJICogLSBJZiBhIGJhc2VfYWRkciBwYXJhbWV0ZXIgaXMgZ2l2
ZW4sIGNvbXBhcmUgaXQKIAkgKiAgIHdpdGggdGhlIGJhc2VfYWRkciBvZiB0aGUgYWRhcHRl
ciB3ZSBmb3VuZAogCSAqIC0gQ2hlY2sgdGhhdCB0aGUgaXJxIGFuZCB0aGUgYmFzZV9hZGRy
IG9mIHRoZQogCSAqICAgYWRhcHRlciB3ZSBmb3VuZCBpcyBub3QgYWxyZWFkeSBpbiB1c2Ug
YnkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL29yaW5vY28vb3Jpbm9jby5o
IGIvZHJpdmVycy9uZXQvd2lyZWxlc3Mvb3Jpbm9jby9vcmlub2NvLmgKaW5kZXggOGU1YTcy
Yy4uNWRmNzgzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3Mvb3Jpbm9jby9v
cmlub2NvLmgKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3Mvb3Jpbm9jby9vcmlub2NvLmgK
QEAgLTExNSw3ICsxMTUsNyBAQCBzdHJ1Y3Qgb3Jpbm9jb19wcml2YXRlIHsKIAl1bnNpZ25l
ZCBpbnQgYnJva2VuX2Rpc2FibGVwb3J0OjE7CiAJdW5zaWduZWQgaW50IGJyb2tlbl9tb25p
dG9yOjE7CiAKLQkvKiBDb25maWd1cmF0aW9uIHBhcmFtYXRlcnMgKi8KKwkvKiBDb25maWd1
cmF0aW9uIHBhcmFtZXRlcnMgKi8KIAl1MzIgaXdfbW9kZTsKIAlpbnQgcHJlZmVyX3BvcnQz
OwogCXUxNiBlbmNvZGVfYWxnLCB3ZXBfcmVzdHJpY3QsIHR4X2tleTsKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL3A1NC9wNTRzcGkuYyBiL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL3A1NC9wNTRzcGkuYwppbmRleCAyYjIyMmFhLi5iODNhN2I0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL25ldC93aXJlbGVzcy9wNTQvcDU0c3BpLmMKKysrIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvcDU0L3A1NHNwaS5jCkBAIC00Miw3ICs0Miw3IEBAIE1PRFVMRV9BTElBUygic3Rs
YzQ1eHgiKTsKIC8qCiAgKiBncGlvcyBzaG91bGQgYmUgaGFuZGxlZCBpbiBib2FyZCBmaWxl
cyBhbmQgcHJvdmlkZWQgdmlhIHBsYXRmb3JtIGRhdGEsCiAgKiBidXQgYmVjYXVzZSBpdCdz
IGN1cnJlbnRseSBpbXBvc3NpYmxlIGZvciBwNTRzcGkgdG8gaGF2ZSBhIGhlYWRlciBmaWxl
Ci0gKiBpbiBpbmNsdWRlL2xpbnV4LCBsZXQncyB1c2UgbW9kdWxlIHBhcmFtYXRlcnMgZm9y
IG5vdworICogaW4gaW5jbHVkZS9saW51eCwgbGV0J3MgdXNlIG1vZHVsZSBwYXJhbWV0ZXJz
IGZvciBub3cKICAqLwogCiBzdGF0aWMgaW50IHA1NHNwaV9ncGlvX3Bvd2VyID0gOTc7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3Njc2kvcWxhMTI4MC5jIGIvZHJpdmVycy9zY3NpL3FsYTEy
ODAuYwppbmRleCBkZjA5ODIwLi5hMWZjNDQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Njc2kv
cWxhMTI4MC5jCisrKyBiL2RyaXZlcnMvc2NzaS9xbGExMjgwLmMKQEAgLTQzMjYsNyArNDMy
Niw3IEBAIHFsYTEyODBfcHJvYmVfb25lKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBz
dHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiAJCWdvdG8gZXJyb3JfcmVsZWFzZV9yZWdpb247
CiAJfQogCi0JLyogbG9hZCB0aGUgRi9XLCByZWFkIHBhcmFtYXRlcnMsIGFuZCBpbml0IHRo
ZSBIL1cgKi8KKwkvKiBsb2FkIHRoZSBGL1csIHJlYWQgcGFyYW1ldGVycywgYW5kIGluaXQg
dGhlIEgvVyAqLwogCWlmIChxbGExMjgwX2luaXRpYWxpemVfYWRhcHRlcihoYSkpIHsKIAkJ
cHJpbnRrKEtFUk5fSU5GTyAicWxhMXgxNjA6IEZhaWxlZCB0byBpbml0aWFsaXplIGFkYXB0
ZXJcbiIpOwogCQlnb3RvIGVycm9yX2ZyZWVfaXJxOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
Y3NpL3FsYTR4eHgvcWw0X21ieC5jIGIvZHJpdmVycy9zY3NpL3FsYTR4eHgvcWw0X21ieC5j
CmluZGV4IDA1MWIwZjUuLmNkMTgwMjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2NzaS9xbGE0
eHh4L3FsNF9tYnguYworKysgYi9kcml2ZXJzL3Njc2kvcWxhNHh4eC9xbDRfbWJ4LmMKQEAg
LTI1MCw3ICsyNTAsNyBAQCBpbnQgcWxhNHh4eF9pbml0aWFsaXplX2Z3X2NiKHN0cnVjdCBz
Y3NpX3FsYV9ob3N0ICogaGEpCiAJLyptZW1jcHkoaGEtPmFsaWFzLCBpbml0X2Z3X2NiLT5B
bGlhcywKIAkgICAgICAgbWluKHNpemVvZihoYS0+YWxpYXMpLCBzaXplb2YoaW5pdF9md19j
Yi0+QWxpYXMpKSk7Ki8KIAotCS8qIFNhdmUgQ29tbWFuZCBMaW5lIFBhcmFtYXRlciBpbmZv
ICovCisJLyogU2F2ZSBDb21tYW5kIExpbmUgUGFyYW1ldGVyIGluZm8gKi8KIAloYS0+cG9y
dF9kb3duX3JldHJ5X2NvdW50ID0gbGUxNl90b19jcHUoaW5pdF9md19jYi0+cHJpLmNvbm5f
a2FfdGltZW91dCk7CiAJaGEtPmRpc2NvdmVyeV93YWl0ID0gcWw0eGRpc2NvdmVyeXdhaXQ7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9lcGwvRXBsSW5zdERlZi5oIGIvZHJp
dmVycy9zdGFnaW5nL2VwbC9FcGxJbnN0RGVmLmgKaW5kZXggODllZmJmMi4uMWYyZmQyZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2VwbC9FcGxJbnN0RGVmLmgKKysrIGIvZHJp
dmVycy9zdGFnaW5nL2VwbC9FcGxJbnN0RGVmLmgKQEAgLTE2Myw3ICsxNjMsNyBAQCB0eXBl
ZGVmIEJZVEUgdEVwbEluc3RhbmNlSGRsOwogICAgIC8vLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIAogICAgIC8vIG1hY3JvcyBmb3IgZGVjbGFyYXRpb24gd2l0aGluIHRo
ZSBmdW5jdGlvbiBoZWFkZXIsIHByb3RvdHlwZSBvciBsb2NhbCB2YXIgbGlzdAotICAgIC8v
IERlY2xhcmF0aW9uIG9mIHBvaW50ZXJzIHdpdGhpbiBmdW5jdGlvbiBwYXJhbWF0ZXIgbGlz
dCBtdXN0IGRlZmluZWQgYXMgdm9pZCBNRU0qCisgICAgLy8gRGVjbGFyYXRpb24gb2YgcG9p
bnRlcnMgd2l0aGluIGZ1bmN0aW9uIHBhcmFtZXRlciBsaXN0IG11c3QgZGVmaW5lZCBhcyB2
b2lkIE1FTSoKICAgICAvLyBwb2ludGVyLgogI2RlZmluZSBFUExfTUNPX0RFQ0xfSU5TVEFO
Q0VfUFRSICAgICAgICAgICAgICAgICAgIHZvaWQgTUVNKiBwSW5zdGFuY2UKICNkZWZpbmUg
RVBMX01DT19ERUNMX0lOU1RBTkNFX1BUUl8gICAgICAgICAgICAgICAgICB2b2lkIE1FTSog
cEluc3RhbmNlLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3J0Mjg2MC9ydDI4eHgu
aCBiL2RyaXZlcnMvc3RhZ2luZy9ydDI4NjAvcnQyOHh4LmgKaW5kZXggZmYyMzA0My4uZWVm
YzdkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0Mjg2MC9ydDI4eHguaAorKysg
Yi9kcml2ZXJzL3N0YWdpbmcvcnQyODYwL3J0Mjh4eC5oCkBAIC0xMDYzLDcgKzEwNjMsNyBA
QCB0eXBlZGVmCXVuaW9uCV9MR19GQktfQ0ZHMV9TVFJVQwl7CiAjZW5kaWYKIAogLy89PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0v
Lz09PT09PT09PT09PT09PT0gUHJvdGVjdGlvbiBQYXJhbWF0ZXI9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQorLy89PT09PT09PT09PT09PT09IFByb3RlY3Rpb24gUGFyYW1l
dGVyPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIC8vPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQogI2RlZmluZSBDQ0tf
UFJPVF9DRkcJMHgxMzY0CQkvL0NDSyBQcm90ZWN0aW9uCiAjZGVmaW5lIEFTSUNfU0hPUlRO
QVYJCTEKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ydDI4NzAvcnQyOHh4LmggYi9k
cml2ZXJzL3N0YWdpbmcvcnQyODcwL3J0Mjh4eC5oCmluZGV4IDM5MjdkMjIuLjlhOWI3MDgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ydDI4NzAvcnQyOHh4LmgKKysrIGIvZHJp
dmVycy9zdGFnaW5nL3J0Mjg3MC9ydDI4eHguaApAQCAtMTA2Myw3ICsxMDYzLDcgQEAgdHlw
ZWRlZgl1bmlvbglfTEdfRkJLX0NGRzFfU1RSVUMJewogI2VuZGlmCiAKIC8vPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLy89PT09
PT09PT09PT09PT09IFByb3RlY3Rpb24gUGFyYW1hdGVyPT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KKy8vPT09PT09PT09PT09PT09PSBQcm90ZWN0aW9uIFBhcmFtZXRlcj09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAvLz09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KICNkZWZpbmUgQ0NLX1BST1Rf
Q0ZHCTB4MTM2NAkJLy9DQ0sgUHJvdGVjdGlvbgogI2RlZmluZSBBU0lDX1NIT1JUTkFWCQkx
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL21lc3NhZ2UuYyBiL2RyaXZlcnMvdXNi
L2NvcmUvbWVzc2FnZS5jCmluZGV4IDMwYTA2OTAuLjQzNWU0M2UgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdXNiL2NvcmUvbWVzc2FnZS5jCisrKyBiL2RyaXZlcnMvdXNiL2NvcmUvbWVzc2Fn
ZS5jCkBAIC0xNzIsNyArMTcyLDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwodXNiX2NvbnRyb2xf
bXNnKTsKICAqIHdhaXRzIGZvciB0aGUgbWVzc2FnZSB0byBjb21wbGV0ZSwgb3IgdGltZW91
dC4KICAqCiAgKiBJZiBzdWNjZXNzZnVsLCBpdCByZXR1cm5zIDAsIG90aGVyd2lzZSBhIG5l
Z2F0aXZlIGVycm9yIG51bWJlci4gIFRoZSBudW1iZXIKLSAqIG9mIGFjdHVhbCBieXRlcyB0
cmFuc2ZlcnJlZCB3aWxsIGJlIHN0b3JlZCBpbiB0aGUgYWN0dWFsX2xlbmd0aCBwYXJhbWF0
ZXIuCisgKiBvZiBhY3R1YWwgYnl0ZXMgdHJhbnNmZXJyZWQgd2lsbCBiZSBzdG9yZWQgaW4g
dGhlIGFjdHVhbF9sZW5ndGggcGFyYW1ldGVyLgogICoKICAqIERvbid0IHVzZSB0aGlzIGZ1
bmN0aW9uIGZyb20gd2l0aGluIGFuIGludGVycnVwdCBjb250ZXh0LCBsaWtlIGEgYm90dG9t
IGhhbGYKICAqIGhhbmRsZXIuICBJZiB5b3UgbmVlZCBhbiBhc3luY2hyb25vdXMgbWVzc2Fn
ZSwgb3IgbmVlZCB0byBzZW5kIGEgbWVzc2FnZQpAQCAtMjA1LDcgKzIwNSw3IEBAIEVYUE9S
VF9TWU1CT0xfR1BMKHVzYl9pbnRlcnJ1cHRfbXNnKTsKICAqIGFuZCB3YWl0cyBmb3IgdGhl
IG1lc3NhZ2UgdG8gY29tcGxldGUsIG9yIHRpbWVvdXQuCiAgKgogICogSWYgc3VjY2Vzc2Z1
bCwgaXQgcmV0dXJucyAwLCBvdGhlcndpc2UgYSBuZWdhdGl2ZSBlcnJvciBudW1iZXIuICBU
aGUgbnVtYmVyCi0gKiBvZiBhY3R1YWwgYnl0ZXMgdHJhbnNmZXJyZWQgd2lsbCBiZSBzdG9y
ZWQgaW4gdGhlIGFjdHVhbF9sZW5ndGggcGFyYW1hdGVyLgorICogb2YgYWN0dWFsIGJ5dGVz
IHRyYW5zZmVycmVkIHdpbGwgYmUgc3RvcmVkIGluIHRoZSBhY3R1YWxfbGVuZ3RoIHBhcmFt
ZXRlci4KICAqCiAgKiBEb24ndCB1c2UgdGhpcyBmdW5jdGlvbiBmcm9tIHdpdGhpbiBhbiBp
bnRlcnJ1cHQgY29udGV4dCwgbGlrZSBhIGJvdHRvbSBoYWxmCiAgKiBoYW5kbGVyLiAgSWYg
eW91IG5lZWQgYW4gYXN5bmNocm9ub3VzIG1lc3NhZ2UsIG9yIG5lZWQgdG8gc2VuZCBhIG1l
c3NhZ2UKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL3NlcmlhbC9pb19lZGdlcG9ydC5jIGIv
ZHJpdmVycy91c2Ivc2VyaWFsL2lvX2VkZ2Vwb3J0LmMKaW5kZXggZTg1YzhjMC4uYTI0MmVm
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2Ivc2VyaWFsL2lvX2VkZ2Vwb3J0LmMKKysrIGIv
ZHJpdmVycy91c2Ivc2VyaWFsL2lvX2VkZ2Vwb3J0LmMKQEAgLTE1MSw3ICsxNTEsNyBAQCBz
dHJ1Y3QgZWRnZXBvcnRfc2VyaWFsIHsKIAlfX3U4CQkJcnhIZWFkZXIzOwkJCS8qIHJlY2Vp
dmUgaGVhZGVyIGJ5dGUgMyAqLwogCV9fdTgJCQlyeFBvcnQ7CQkJCS8qIHRoZSBwb3J0IHRo
YXQgd2UgYXJlIGN1cnJlbnRseSByZWNlaXZpbmcgZGF0YSBmb3IgKi8KIAlfX3U4CQkJcnhT
dGF0dXNDb2RlOwkJCS8qIHRoZSByZWNlaXZlIHN0YXR1cyBjb2RlICovCi0JX191OAkJCXJ4
U3RhdHVzUGFyYW07CQkJLyogdGhlIHJlY2VpdmUgc3RhdHVzIHBhcmFtYXRlciAqLworCV9f
dTgJCQlyeFN0YXR1c1BhcmFtOwkJCS8qIHRoZSByZWNlaXZlIHN0YXR1cyBwYXJhbWV0ZXIg
Ki8KIAlfX3MxNgkJCXJ4Qnl0ZXNSZW1haW5pbmc7CQkvKiB0aGUgbnVtYmVyIG9mIHBvcnQg
Ynl0ZXMgbGVmdCB0byByZWFkICovCiAJc3RydWN0IHVzYl9zZXJpYWwJKnNlcmlhbDsJCQkv
KiBsb29wIGJhY2sgdG8gdGhlIG93bmVyIG9mIHRoaXMgb2JqZWN0ICovCiB9OwpkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2Ivc2VyaWFsL2lyLXVzYi5jIGIvZHJpdmVycy91c2Ivc2VyaWFs
L2lyLXVzYi5jCmluZGV4IDRlMmNkYTkuLmJmNGUyZjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dXNiL3NlcmlhbC9pci11c2IuYworKysgYi9kcml2ZXJzL3VzYi9zZXJpYWwvaXItdXNiLmMK
QEAgLTQ3LDcgKzQ3LDcgQEAKICAqCiAgKiAyMDAxX05vdl8wMQlncmVnIGtoCiAgKglBZGRl
ZCBzdXBwb3J0IGZvciBtb3JlIElyREEgVVNCIGRldmljZXMuCi0gKglBZGRlZCBzdXBwb3J0
IGZvciB6ZXJvIHBhY2tldC4gIEFkZGVkIGJ1ZmZlciBvdmVycmlkZSBwYXJhbWF0ZXIsIHNv
CisgKglBZGRlZCBzdXBwb3J0IGZvciB6ZXJvIHBhY2tldC4gIEFkZGVkIGJ1ZmZlciBvdmVy
cmlkZSBwYXJhbWV0ZXIsIHNvCiAgKgl1c2VycyBjYW4gdHJhbnNmZXIgbGFyZ2VyIHBhY2tl
dHMgYXQgb25jZSBpZiB0aGV5IHdpc2guICBCb3RoIHBhdGNoZXMKICAqCWNhbWUgZnJvbSBE
YWcgQnJhdHRsaSA8ZGFnQG9iZXhjb2RlLmNvbT4uCiAgKgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9jb250cm9sZmIuYyBiL2RyaXZlcnMvdmlkZW8vY29udHJvbGZiLmMKaW5kZXgg
NDlmY2JlOC4uYjg5MjlkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9jb250cm9sZmIu
YworKysgYi9kcml2ZXJzL3ZpZGVvL2NvbnRyb2xmYi5jCkBAIC03OTIsNyArNzkyLDcgQEAg
c3RhdGljIGludCByZWFkX2NvbnRyb2xfc2Vuc2Uoc3RydWN0IGZiX2luZm9fY29udHJvbCAq
cCkKICNkZWZpbmUgQ09OVFJPTF9QSVhDTE9DS19NSU4JNTAwMAkvKiB+IDIwMCBNSHogZG90
IGNsb2NrICovCiAKIC8qCi0gKiBjYWxjdWxhdGUgdGhlIGNsb2NrIHBhcmFtYXRlcnMgdG8g
YmUgc2VudCB0byBDVURBIGFjY29yZGluZyB0byBnaXZlbgorICogY2FsY3VsYXRlIHRoZSBj
bG9jayBwYXJhbWV0ZXJzIHRvIGJlIHNlbnQgdG8gQ1VEQSBhY2NvcmRpbmcgdG8gZ2l2ZW4K
ICAqIHBpeGNsb2NrIGluIHBpY28gc2Vjb25kLgogICovCiBzdGF0aWMgaW50IGNhbGNfY2xv
Y2tfcGFyYW1zKHVuc2lnbmVkIGxvbmcgY2xrLCB1bnNpZ25lZCBjaGFyICpwYXJhbSkKZGlm
ZiAtLWdpdCBhL2ZzL2RlYnVnZnMvaW5vZGUuYyBiL2ZzL2RlYnVnZnMvaW5vZGUuYwppbmRl
eCA4MWFlOWVhLi45YTZmODhiIDEwMDY0NAotLS0gYS9mcy9kZWJ1Z2ZzL2lub2RlLmMKKysr
IGIvZnMvZGVidWdmcy9pbm9kZS5jCkBAIC0xODUsNyArMTg1LDcgQEAgc3RhdGljIGludCBk
ZWJ1Z2ZzX2NyZWF0ZV9ieV9uYW1lKGNvbnN0IGNoYXIgKm5hbWUsIG1vZGVfdCBtb2RlLAog
ICogQG5hbWU6IGEgcG9pbnRlciB0byBhIHN0cmluZyBjb250YWluaW5nIHRoZSBuYW1lIG9m
IHRoZSBmaWxlIHRvIGNyZWF0ZS4KICAqIEBtb2RlOiB0aGUgcGVybWlzc2lvbiB0aGF0IHRo
ZSBmaWxlIHNob3VsZCBoYXZlCiAgKiBAcGFyZW50OiBhIHBvaW50ZXIgdG8gdGhlIHBhcmVu
dCBkZW50cnkgZm9yIHRoaXMgZmlsZS4gIFRoaXMgc2hvdWxkIGJlIGEKLSAqICAgICAgICAg
IGRpcmVjdG9yeSBkZW50cnkgaWYgc2V0LiAgSWYgdGhpcyBwYXJhbWF0ZXIgaXMgTlVMTCwg
dGhlbiB0aGUKKyAqICAgICAgICAgIGRpcmVjdG9yeSBkZW50cnkgaWYgc2V0LiAgSWYgdGhp
cyBwYXJhbWV0ZXIgaXMgTlVMTCwgdGhlbiB0aGUKICAqICAgICAgICAgIGZpbGUgd2lsbCBi
ZSBjcmVhdGVkIGluIHRoZSByb290IG9mIHRoZSBkZWJ1Z2ZzIGZpbGVzeXN0ZW0uCiAgKiBA
ZGF0YTogYSBwb2ludGVyIHRvIHNvbWV0aGluZyB0aGF0IHRoZSBjYWxsZXIgd2lsbCB3YW50
IHRvIGdldCB0byBsYXRlcgogICogICAgICAgIG9uLiAgVGhlIGlub2RlLmlfcHJpdmF0ZSBw
b2ludGVyIHdpbGwgcG9pbnQgdG8gdGhpcyB2YWx1ZSBvbgpAQCAtMjQzLDcgKzI0Myw3IEBA
IEVYUE9SVF9TWU1CT0xfR1BMKGRlYnVnZnNfY3JlYXRlX2ZpbGUpOwogICogQG5hbWU6IGEg
cG9pbnRlciB0byBhIHN0cmluZyBjb250YWluaW5nIHRoZSBuYW1lIG9mIHRoZSBkaXJlY3Rv
cnkgdG8KICAqICAgICAgICBjcmVhdGUuCiAgKiBAcGFyZW50OiBhIHBvaW50ZXIgdG8gdGhl
IHBhcmVudCBkZW50cnkgZm9yIHRoaXMgZmlsZS4gIFRoaXMgc2hvdWxkIGJlIGEKLSAqICAg
ICAgICAgIGRpcmVjdG9yeSBkZW50cnkgaWYgc2V0LiAgSWYgdGhpcyBwYXJhbWF0ZXIgaXMg
TlVMTCwgdGhlbiB0aGUKKyAqICAgICAgICAgIGRpcmVjdG9yeSBkZW50cnkgaWYgc2V0LiAg
SWYgdGhpcyBwYXJhbWV0ZXIgaXMgTlVMTCwgdGhlbiB0aGUKICAqICAgICAgICAgIGRpcmVj
dG9yeSB3aWxsIGJlIGNyZWF0ZWQgaW4gdGhlIHJvb3Qgb2YgdGhlIGRlYnVnZnMgZmlsZXN5
c3RlbS4KICAqCiAgKiBUaGlzIGZ1bmN0aW9uIGNyZWF0ZXMgYSBkaXJlY3RvcnkgaW4gZGVi
dWdmcyB3aXRoIHRoZSBnaXZlbiBuYW1lLgpAQCAtMjY5LDcgKzI2OSw3IEBAIEVYUE9SVF9T
WU1CT0xfR1BMKGRlYnVnZnNfY3JlYXRlX2Rpcik7CiAgKiBAbmFtZTogYSBwb2ludGVyIHRv
IGEgc3RyaW5nIGNvbnRhaW5pbmcgdGhlIG5hbWUgb2YgdGhlIHN5bWJvbGljIGxpbmsgdG8K
ICAqICAgICAgICBjcmVhdGUuCiAgKiBAcGFyZW50OiBhIHBvaW50ZXIgdG8gdGhlIHBhcmVu
dCBkZW50cnkgZm9yIHRoaXMgc3ltYm9saWMgbGluay4gIFRoaXMKLSAqICAgICAgICAgIHNo
b3VsZCBiZSBhIGRpcmVjdG9yeSBkZW50cnkgaWYgc2V0LiAgSWYgdGhpcyBwYXJhbWF0ZXIg
aXMgTlVMTCwKKyAqICAgICAgICAgIHNob3VsZCBiZSBhIGRpcmVjdG9yeSBkZW50cnkgaWYg
c2V0LiAgSWYgdGhpcyBwYXJhbWV0ZXIgaXMgTlVMTCwKICAqICAgICAgICAgIHRoZW4gdGhl
IHN5bWJvbGljIGxpbmsgd2lsbCBiZSBjcmVhdGVkIGluIHRoZSByb290IG9mIHRoZSBkZWJ1
Z2ZzCiAgKiAgICAgICAgICBmaWxlc3lzdGVtLgogICogQHRhcmdldDogYSBwb2ludGVyIHRv
IGEgc3RyaW5nIGNvbnRhaW5pbmcgdGhlIHBhdGggdG8gdGhlIHRhcmdldCBvZiB0aGUKLS0g
CjEuNi4wLjQKCg==
--------------060500020800010600090208--
