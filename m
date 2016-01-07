From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jan 2016 09:34:13 +0000
Subject: [patch] staging: unisys: remove some dead code
Message-Id: <20160107093413.GA27186@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

queue_delayed_work() returns bool, not negative error codes.  It returns
false if the work has already been queued or true otherwise.  Since
we don't care about that, we can just remove the test.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/unisys/visorbus/visorchipset.c b/drivers/staging/unisys/visorbus/visorchipset.c
index 07594f4..ff2bd077 100644
--- a/drivers/staging/unisys/visorbus/visorchipset.c
+++ b/drivers/staging/unisys/visorbus/visorchipset.c
@@ -2310,13 +2310,8 @@ visorchipset_init(struct acpi_device *acpi_device)
 	}
 	most_recent_message_jiffies = jiffies;
 	poll_jiffies = POLLJIFFIES_CONTROLVMCHANNEL_FAST;
-	rc = queue_delayed_work(periodic_controlvm_workqueue,
-				&periodic_controlvm_work, poll_jiffies);
-	if (rc < 0) {
-		POSTCODE_LINUX_2(QUEUE_DELAYED_WORK_PC,
-				 DIAG_SEVERITY_ERR);
-		goto cleanup;
-	}
+	queue_delayed_work(periodic_controlvm_workqueue,
+			   &periodic_controlvm_work, poll_jiffies);
 
 	visorchipset_platform_device.dev.devt = major_dev;
 	if (platform_device_register(&visorchipset_platform_device) < 0) {
