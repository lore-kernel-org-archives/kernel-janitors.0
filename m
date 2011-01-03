From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 05:59:20 +0000
Subject: [patch 2/2] [SCSI] target: unlock on error path in configfs
Message-Id: <20110103055920.GV1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: James Bottomley <James.Bottomley@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org

If the user wrote a wrong value to the file the it would lead to a dead
lock eventually.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index d7b977d..2764510 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -660,6 +660,7 @@ static ssize_t target_core_dev_store_attr_##_name(			\
 	}								\
 	ret = strict_strtoul(page, 0, &val);				\
 	if (ret < 0) {							\
+		spin_unlock(&se_dev->se_dev_lock);                      \
 		printk(KERN_ERR "strict_strtoul() failed with"		\
 			" ret: %d\n", ret);				\
 		return -EINVAL;						\
