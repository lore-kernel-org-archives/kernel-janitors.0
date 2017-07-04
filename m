From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Jul 2017 16:09:19 +0000
Subject: [PATCH][-next] mqueue: fix incorrect memset size for object v
Message-Id: <20170704160919.19406-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Steven Whitehouse <swhiteho@redhat.com>, Deepa Dinamani <deepa.kernel@gmail.com>, Waiman Long <longman@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The size of the memset is incorrect, it is currently using the size
of attr (a struct mq_attr *) and not of v (a struct compat_mq_attr)

Detected by CoverityScan, CID#1449362 ("Wrong sizeof argument")

Fixes: 045256d59da6 ("mqueue: move compat syscalls to native ones")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 ipc/mqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index a1a326569268..c9ff943f19ab 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -1449,7 +1449,7 @@ static inline int put_compat_mq_attr(const struct mq_attr *attr,
 {
 	struct compat_mq_attr v;
 
-	memset(&v, 0, sizeof(attr));
+	memset(&v, 0, sizeof(v));
 	v.mq_flags = attr->mq_flags;
 	v.mq_maxmsg = attr->mq_maxmsg;
 	v.mq_msgsize = attr->mq_msgsize;
-- 
2.11.0

