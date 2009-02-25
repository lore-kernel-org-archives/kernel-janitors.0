From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 20:31:37 +0000
Subject: [PATCH 2/8] 9p: fix sparse warning: cast adds address space
Message-Id: <20090225203132.6251.63332.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090225203012.6251.32002.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090225203012.6251.32002.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Trust in the comment and add '__force' to the cast.

Fix this sparse warning:
  net/9p/trans_fd.c:420:34: warning: cast adds address space to expression (<asn:1>)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 net/9p/trans_fd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/9p/trans_fd.c b/net/9p/trans_fd.c
index 1df0356..c613ed0 100644
--- a/net/9p/trans_fd.c
+++ b/net/9p/trans_fd.c
@@ -417,7 +417,7 @@ static int p9_fd_write(struct p9_client *client, void *v, int len)
 	oldfs = get_fs();
 	set_fs(get_ds());
 	/* The cast to a user pointer is valid due to the set_fs() */
-	ret = vfs_write(ts->wr, (void __user *)v, len, &ts->wr->f_pos);
+	ret = vfs_write(ts->wr, (__force void __user *)v, len, &ts->wr->f_pos);
 	set_fs(oldfs);
 
 	if (ret <= 0 && ret != -ERESTARTSYS && ret != -EAGAIN)

