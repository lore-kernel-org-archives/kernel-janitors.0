From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 20:38:39 +0000
Subject: [patch v2] intel_ips: cleanup a couple error messages
Message-Id: <20130722203839.GA22020@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719055144.GE9729@elgon.mountain>
In-Reply-To: <20130719055144.GE9729@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Printing PTR_ERR(NULL) is not useful so I have updated the error
messages a little.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: completely different

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 18dcb58..e5c115d 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1329,9 +1329,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 
 	ips->debug_root = debugfs_create_dir("ips", NULL);
 	if (!ips->debug_root) {
-		dev_err(&ips->dev->dev,
-			"failed to create debugfs entries: %ld\n",
-			PTR_ERR(ips->debug_root));
+		dev_err(&ips->dev->dev, "failed to create debugfs entries\n");
 		return;
 	}
 
@@ -1345,8 +1343,8 @@ static void ips_debugfs_init(struct ips_driver *ips)
 					  &ips_debugfs_ops);
 		if (!ent) {
 			dev_err(&ips->dev->dev,
-				"failed to create debug file: %ld\n",
-				PTR_ERR(ent));
+				"failed to create debug file: %s\n",
+				node->name);
 			goto err_cleanup;
 		}
 	}
