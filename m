From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Feb 2018 09:45:35 +0000
Subject: [PATCH 1/2] scsi: myrs: cleanup myrs_store_suppress_enclosure_messages()
Message-Id: <20180220094535.GA22646@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This code causes a static checker because we have an upper bound on
"value" but not a lower bound.  In other words "value" can be s32min-2.
It's harmless but really it should just be bool.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/myrs.c b/drivers/scsi/myrs.c
index 3b87c6942a8e..eaa9d143a282 100644
--- a/drivers/scsi/myrs.c
+++ b/drivers/scsi/myrs.c
@@ -1590,15 +1590,12 @@ static ssize_t myrs_store_suppress_enclosure_messages(struct device *dev,
 {
 	struct scsi_device *sdev = to_scsi_device(dev);
 	myrs_hba *cs = (myrs_hba *)sdev->host->hostdata;
-	char tmpbuf[8];
-	ssize_t len;
-	int value;
+	bool value;
+	int ret;
 
-	len = count > sizeof(tmpbuf) - 1 ? sizeof(tmpbuf) - 1 : count;
-	strncpy(tmpbuf, buf, len);
-	tmpbuf[len] = '\0';
-	if (sscanf(tmpbuf, "%d", &value) != 1 || value > 2)
-		return -EINVAL;
+	ret = kstrtobool(buf, &value);
+	if (ret)
+		return ret;
 
 	cs->disable_enc_msg = value;
 	return count;
