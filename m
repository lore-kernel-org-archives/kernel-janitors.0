From: Dan Carpenter <error27@gmail.com>
Date: Wed, 26 Jan 2011 08:58:25 +0000
Subject: [patch] [SCSI] target: allow release() to be called on NULL
Message-Id: <20110126085825.GM2721@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: James Bottomley <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a cleanup and not a bugfix.

container_of() does pointer math and the result of that math can
basically not be NULL here so "se_dev" is non-NULL.

Normally release() type functions accept a NULL parameter.  I don't
think target_core_dev_release() is ever called with a NULL parameter but
it's a cleaner to allow that.

So instead of checking "se_dev", I've changed it to check "item".

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index 2764510..d9dcd9d 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -1973,7 +1973,7 @@ static void target_core_dev_release(struct config_item *item)
 				struct se_subsystem_dev, se_dev_group);
 	struct config_group *dev_cg;
 
-	if (!(se_dev))
+	if (!item)
 		return;
 
 	dev_cg = &se_dev->se_dev_group;
