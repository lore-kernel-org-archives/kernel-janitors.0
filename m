From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jul 2013 05:51:44 +0000
Subject: [patch] intel_ips: fix error handling for debugfs_create_dir()
Message-Id: <20130719055144.GE9729@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

If debugfs is not enabled then debugfs_create_dir() returns
ERR_PTR(-ENODEV).  Also my static checker complains that we are trying
to print the error code, but it's is always just NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 18dcb58..4416d92 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1328,7 +1328,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 	int i;
 
 	ips->debug_root = debugfs_create_dir("ips", NULL);
-	if (!ips->debug_root) {
+	if (IS_ERR_OR_NULL(ips->debug_root)) {
 		dev_err(&ips->dev->dev,
 			"failed to create debugfs entries: %ld\n",
 			PTR_ERR(ips->debug_root));
@@ -1343,7 +1343,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 		ent = debugfs_create_file(node->name, S_IFREG | S_IRUGO,
 					  ips->debug_root, node,
 					  &ips_debugfs_ops);
-		if (!ent) {
+		if (IS_ERR_OR_NULL(ent)) {
 			dev_err(&ips->dev->dev,
 				"failed to create debug file: %ld\n",
 				PTR_ERR(ent));
