From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jan 2012 07:59:49 +0000
Subject: [patch] exofs: add a cap on the memcpy() size
Message-Id: <20120130075949.GA22364@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This data comes from the device, so probably it's fairly trustworthy but
it makes the static checkers happy if we check it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/exofs/super.c b/fs/exofs/super.c
index d22cd16..755812a 100644
--- a/fs/exofs/super.c
+++ b/fs/exofs/super.c
@@ -529,6 +529,8 @@ static int exofs_devs_2_odi(struct exofs_dt_device_info *dt_dev,
 			     struct osd_dev_info *odi)
 {
 	odi->systemid_len = le32_to_cpu(dt_dev->systemid_len);
+	if (odi->systemid_len > OSD_SYSTEMID_LEN)
+		return -EINVAL;
 	memcpy(odi->systemid, dt_dev->systemid, odi->systemid_len);
 
 	odi->osdname_len = le32_to_cpu(dt_dev->osdname_len);
