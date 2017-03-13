From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Mar 2017 12:34:14 +0000
Subject: [PATCH] staging: atomisp: potential underflow in atomisp_get_metadata_by_type()
Message-Id: <20170313123414.GB9287@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Alan Cox <alan@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

md_type is an enum.  On my tests, GCC treats it as unsigned but
according to the C standard it's an implementation dependant thing so we
should check for negatives.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
index d9a5c24633cb..0d77ebc5c865 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c
@@ -3005,7 +3005,7 @@ int atomisp_get_metadata_by_type(struct atomisp_sub_device *asd, int flag,
 		return 0;
 
 	md_type = md->type;
-	if (md_type >= ATOMISP_METADATA_TYPE_NUM)
+	if (md_type < 0 || md_type >= ATOMISP_METADATA_TYPE_NUM)
 		return -EINVAL;
 
 	/* This is done in the atomisp_buf_done() */
