From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Dec 2020 18:54:21 +0000
Subject: [PATCH] ceph: remove redundant assignment to variable i
Message-Id: <20201204185421.1149669-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable i is being initialized with a value that is never read
and it is being updated later with a new value in a for-loop.  The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ceph/mds_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 8f1d7500a7ec..b70937caa7a7 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -1243,7 +1243,7 @@ static struct ceph_msg *create_session_open_msg(struct ceph_mds_client *mdsc, u6
 {
 	struct ceph_msg *msg;
 	struct ceph_mds_session_head *h;
-	int i = -1;
+	int i;
 	int extra_bytes = 0;
 	int metadata_key_count = 0;
 	struct ceph_options *opt = mdsc->fsc->client->options;
-- 
2.29.2
