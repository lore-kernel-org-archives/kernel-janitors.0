From: Julia Lawall <julia@diku.dk>
Date: Thu, 11 Sep 2008 12:33:50 +0000
Subject: [PATCH 3/5] fs/namespace.c: Drop code after return
Message-Id: <Pine.LNX.4.64.0809111433270.9593@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, vigneshbabu@gmail.com, richard.genoud@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The extra semicolon serves no purpose.

Signed-off-by: Julia Lawall <julia@diku.dk>
---

 fs/namespace.c                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 6e283c9..7e6151a 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1993,7 +1993,7 @@ static struct mnt_namespace *dup_mnt_ns(struct mnt_namespace *mnt_ns,
 	if (!new_ns->root) {
 		up_write(&namespace_sem);
 		kfree(new_ns);
-		return ERR_PTR(-ENOMEM);;
+		return ERR_PTR(-ENOMEM);
 	}
 	spin_lock(&vfsmount_lock);
 	list_add_tail(&new_ns->list, &new_ns->root->mnt_list);
