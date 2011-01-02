From: Dan Carpenter <error27@gmail.com>
Date: Sun, 02 Jan 2011 20:20:42 +0000
Subject: [patch -next] lockd: double unlock in next_host_state()
Message-Id: <20110102202042.GN1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: "J. Bruce Fields" <bfields@fieldses.org>, Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

We unlock again after we goto out.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/lockd/host.c b/fs/lockd/host.c
index c106d6a..5f1bcb2 100644
--- a/fs/lockd/host.c
+++ b/fs/lockd/host.c
@@ -532,7 +532,6 @@ static struct nlm_host *next_host_state(struct hlist_head *cache,
 			host->h_state++;
 
 			nlm_get_host(host);
-			mutex_unlock(&nlm_host_mutex);
 			goto out;
 		}
 	}
