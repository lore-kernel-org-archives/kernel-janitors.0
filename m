From: Dan Carpenter <error27@gmail.com>
Date: Fri, 15 Oct 2010 20:36:48 +0000
Subject: [patch] Staging: intel_sst: off by one bug
Message-Id: <20101015203644.GO6614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This should be >= instead of > or we go passed the end of the array.

Also the arrays are declared with size MAX_NUM_STREAMS.  This is the
only place that uses MAX_NUM_STREAMS_MFLD.  It seems like asking for
trouble to use two variables for the same information.  I've changed
everything to use MAX_NUM_STREAMS.

This bug isn't really harmful.  In the worst case, if you enabled
debugging then you would see a message.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/intel_sst/intel_sst_fw_ipc.h b/drivers/staging/intel_sst/intel_sst_fw_ipc.h
index 1a2f67f..9d3c368 100644
--- a/drivers/staging/intel_sst/intel_sst_fw_ipc.h
+++ b/drivers/staging/intel_sst/intel_sst_fw_ipc.h
@@ -31,7 +31,6 @@
 */
 
 #define MAX_NUM_STREAMS_MRST 3
-#define MAX_NUM_STREAMS_MFLD 6
 #define MAX_NUM_STREAMS 6
 #define MAX_DBG_RW_BYTES 80
 #define MAX_NUM_SCATTER_BUFFERS 8
diff --git a/drivers/staging/intel_sst/intel_sst_stream.c b/drivers/staging/intel_sst/intel_sst_stream.c
index 1ce3a9c..b2c4b70 100644
--- a/drivers/staging/intel_sst/intel_sst_stream.c
+++ b/drivers/staging/intel_sst/intel_sst_stream.c
@@ -45,7 +45,7 @@
  */
 int sst_check_device_type(u32 device, u32 num_chan, u32 *pcm_slot)
 {
-	if (device > MAX_NUM_STREAMS_MFLD) {
+	if (device >= MAX_NUM_STREAMS) {
 		pr_debug("sst: device type invalid %d\n", device);
 		return -EINVAL;
 	}
