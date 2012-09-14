From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2012 11:05:56 +0000
Subject: [patch] [SCSI] cleanup some calls to strncmp()
Message-Id: <20120914110556.GB1152@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The main motivation for this patch is that for the first strncmp()
we do 'strncmp(src, "-", 20)' but "src" is a 15 character buffer not 20.

Also since we know that "-" is only two characters, the compare isn't
going to go further than 2 characters into src before deciding that it
doesn't match.

The same applies to the other strncmp()s.  In those cases "str" is
actually 10 characters so the limiter is correct but it is still not
needed when the length for "adapter" and "firmware" is known and less
than 10.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index 093d4f6..bd576ce 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -84,7 +84,7 @@ static int check_set(unsigned int *val, char *src)
 {
 	char *last;
 
-	if (strncmp(src, "-", 20) = 0) {
+	if (strcmp(src, "-") = 0) {
 		*val = SCAN_WILD_CARD;
 	} else {
 		/*
@@ -249,9 +249,9 @@ static DEVICE_ATTR(active_mode, S_IRUGO | S_IWUSR, show_shost_active_mode, NULL)
 
 static int check_reset_type(char *str)
 {
-	if (strncmp(str, "adapter", 10) = 0)
+	if (strcmp(str, "adapter") = 0)
 		return SCSI_ADAPTER_RESET;
-	else if (strncmp(str, "firmware", 10) = 0)
+	else if (strcmp(str, "firmware") = 0)
 		return SCSI_FIRMWARE_RESET;
 	else
 		return 0;
