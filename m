From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jul 2020 15:22:40 +0000
Subject: [PATCH] ceph: remove redundant initialization of variable mds
Message-Id: <20200723152240.992946-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable mds is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ceph/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ceph/debugfs.c b/fs/ceph/debugfs.c
index 070ed8481340..48f5afb56c91 100644
--- a/fs/ceph/debugfs.c
+++ b/fs/ceph/debugfs.c
@@ -272,7 +272,7 @@ static int mds_sessions_show(struct seq_file *s, void *ptr)
 	struct ceph_mds_client *mdsc = fsc->mdsc;
 	struct ceph_auth_client *ac = fsc->client->monc.auth;
 	struct ceph_options *opt = fsc->client->options;
-	int mds = -1;
+	int mds;
 
 	mutex_lock(&mdsc->mutex);
 
-- 
2.27.0
