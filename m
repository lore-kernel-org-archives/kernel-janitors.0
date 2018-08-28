From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Aug 2018 13:01:46 +0000
Subject: [PATCH] afs: remove unused variable ret
Message-Id: <20180828130146.8995-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/server.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/server.c b/fs/afs/server.c
index 1d329e6981d5..cc8f7e9f76c5 100644
--- a/fs/afs/server.c
+++ b/fs/afs/server.c
@@ -153,7 +153,7 @@ static struct afs_server *afs_install_server(struct afs_net *net,
 	const struct afs_addr_list *alist;
 	struct afs_server *server;
 	struct rb_node **pp, *p;
-	int ret = -EEXIST, diff;
+	int diff;
 
 	_enter("%p", candidate);
 
@@ -198,7 +198,6 @@ static struct afs_server *afs_install_server(struct afs_net *net,
 		hlist_add_head_rcu(&server->addr6_link, &net->fs_addresses6);
 
 	write_sequnlock(&net->fs_addr_lock);
-	ret = 0;
 
 exists:
 	afs_get_server(server);
-- 
2.17.1
