From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:51:31 +0000
Subject: [PATCH] staging: atomisp: off by one in atomisp_acc_load_extensions()
Message-Id: <20170314075131.GA6061@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Cox <alan@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

We should be doing i-- on all error paths but we don't if the loop
finishes successfully.  I've re-arranged this so that we don't read
beyond the end of acc_flag_to_pipe[] array.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_acc.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_acc.c
index 4c35a785c7d5..212e0a777b4b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_acc.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_acc.c
@@ -472,10 +472,8 @@ int atomisp_acc_load_extensions(struct atomisp_sub_device *asd)
 					acc_fw->fw,
 					acc_flag_to_pipe[i].pipe_id,
 					acc_fw->type);
-				if (ret) {
-					i--;
+				if (ret)
 					goto error;
-				}
 
 				ext_loaded = true;
 			}
@@ -499,7 +497,7 @@ int atomisp_acc_load_extensions(struct atomisp_sub_device *asd)
 	return 0;
 
 error:
-	for (; i >= 0; i--) {
+	while (--i >= 0) {
 		if (acc_fw->flags & acc_flag_to_pipe[i].flag) {
 			atomisp_css_unload_acc_extension(asd, acc_fw->fw,
 					acc_flag_to_pipe[i].pipe_id);
