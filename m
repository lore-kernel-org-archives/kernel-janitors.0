From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 10 Oct 2010 17:28:43 +0000
Subject: [PATCH] staging: intel_sst: use signed int for error codes
Message-Id: <1286731724-17996-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Harsha Priya <priya.harsha@intel.com>, Vinod Koul <vinod.koul@intel.com>, Alan Cox <alan@linux.intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

As retval stores error code, it should be signed int.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 .../staging/intel_sst/intel_sst_app_interface.c    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c b/drivers/staging/intel_sst/intel_sst_app_interface.c
index 9f31dc5..baf0ddc 100644
--- a/drivers/staging/intel_sst/intel_sst_app_interface.c
+++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
@@ -98,7 +98,7 @@ static int intel_sst_check_device(void)
  */
 int intel_sst_open(struct inode *i_node, struct file *file_ptr)
 {
-	unsigned int retval = intel_sst_check_device();
+	int retval = intel_sst_check_device();
 	if (retval)
 		return retval;
 
@@ -137,7 +137,7 @@ int intel_sst_open(struct inode *i_node, struct file *file_ptr)
  */
 int intel_sst_open_cntrl(struct inode *i_node, struct file *file_ptr)
 {
-	unsigned int retval = intel_sst_check_device();
+	int retval = intel_sst_check_device();
 	if (retval)
 		return retval;
 
-- 
1.7.0.4

