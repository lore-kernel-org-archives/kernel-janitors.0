From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Jan 2013 07:06:02 +0000
Subject: [patch] [SCSI] libosd: check for kzalloc() failure
Message-Id: <20130130070602.GB12396@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: Benny Halevy <bhalevy@tonian.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, osd-dev@open-osd.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

There wasn't any error handling for this kzalloc().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/osd/osd_initiator.c b/drivers/scsi/osd/osd_initiator.c
index c06b8e5..d8293f2 100644
--- a/drivers/scsi/osd/osd_initiator.c
+++ b/drivers/scsi/osd/osd_initiator.c
@@ -144,6 +144,10 @@ static int _osd_get_print_system_info(struct osd_dev *od,
 	odi->osdname_len = get_attrs[a].len;
 	/* Avoid NULL for memcmp optimization 0-length is good enough */
 	odi->osdname = kzalloc(odi->osdname_len + 1, GFP_KERNEL);
+	if (!odi->osdname) {
+		ret = -ENOMEM;
+		goto out;
+	}
 	if (odi->osdname_len)
 		memcpy(odi->osdname, get_attrs[a].val_ptr, odi->osdname_len);
 	OSD_INFO("OSD_NAME               [%s]\n", odi->osdname);
