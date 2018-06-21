From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 21 Jun 2018 01:57:37 +0000
Subject: [PATCH -next] mqueue: fix a typo in mq_init_ns()
Message-Id: <1529546567-74814-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, "Eric W. Biederman" <ebiederm@xmission.com>, David Howells <dhowells@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix a typo, use 'm' instead of 'ns->mq_mnt'.

Fixes: 5cd6a50ace05 ("ipc: Convert mqueue fs to fs_context")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 ipc/mqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 833b8d7..0f10221 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -1620,7 +1620,7 @@ int mq_init_ns(struct ipc_namespace *ns)
 
 	m = mq_create_mount(&init_ipc_ns);
 	if (IS_ERR(m))
-		return PTR_ERR(ns->mq_mnt);
+		return PTR_ERR(m);
 	ns->mq_mnt = m;
 	return 0;
 }

