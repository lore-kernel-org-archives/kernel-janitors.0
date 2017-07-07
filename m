From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jul 2017 08:41:17 +0000
Subject: [PATCH 3/3] lib/test_kmod: fix fs module tests
Message-Id: <20170707084117.jbi3g364jz75liay@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170707083933.2mgnpqafhspbwu7h@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The break was in the wrong place so file system tests don't work as
intended.

Fixes: 39258f448d71 ("kmod: add test driver to stress test the module loader")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/test_kmod.c b/lib/test_kmod.c
index 093b44771197..5a402e610237 100644
--- a/lib/test_kmod.c
+++ b/lib/test_kmod.c
@@ -746,11 +746,11 @@ static int trigger_config_run_type(struct kmod_test_device *test_dev,
 						      strlen(test_str));
 		break;
 	case TEST_KMOD_FS_TYPE:
-		break;
 		kfree_const(config->test_fs);
 		config->test_driver = NULL;
 		copied = config_copy_test_fs(config, test_str,
 					     strlen(test_str));
+		break;
 	default:
 		mutex_unlock(&test_dev->config_mutex);
 		return -EINVAL;
