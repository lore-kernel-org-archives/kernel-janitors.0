From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 May 2017 12:30:32 +0000
Subject: [PATCH] atomisp2: off by one in atomisp_s_input()
Message-Id: <20170522123032.ikxms4grh7wmgj5d@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The isp->inputs[] array has isp->input_cnt elements which have been
initialized so this > should be >=.

This bug is harmless.  The check against ATOM_ISP_MAX_INPUTS prevents us
from reading beyond the end of the array.  The uninitialized elements
are zeroed out so we will end up returning -EINVAL a few lines later
because the .camera pointer is NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c
index 6064bb823a47..aa0526ebaff1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp2/atomisp_ioctl.c
@@ -683,7 +683,7 @@ static int atomisp_s_input(struct file *file, void *fh, unsigned int input)
 	int ret;
 
 	rt_mutex_lock(&isp->mutex);
-	if (input >= ATOM_ISP_MAX_INPUTS || input > isp->input_cnt) {
+	if (input >= ATOM_ISP_MAX_INPUTS || input >= isp->input_cnt) {
 		dev_dbg(isp->dev, "input_cnt: %d\n", isp->input_cnt);
 		ret = -EINVAL;
 		goto error;
