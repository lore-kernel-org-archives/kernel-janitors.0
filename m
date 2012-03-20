From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Mar 2012 13:09:19 +0000
Subject: [patch] aio: change a stray spin_unlock_bh() to spin_unlock()
Message-Id: <20120320130919.GA11307@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-fsdevel@vger.kernel.org, linux-aio@kvack.org, kernel-janitors@vger.kernel.org

We missed this spin_unlock_bh() when we removed the _bh from the other
locks in cb22bbe9f7 "aio: aio_nr_lock is taken only synchronously now"

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/aio.c b/fs/aio.c
index 7b6b9d5..4f71627 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -280,7 +280,7 @@ static struct kioctx *ioctx_alloc(unsigned nr_events)
 	spin_lock(&aio_nr_lock);
 	if (aio_nr + nr_events > aio_max_nr ||
 	    aio_nr + nr_events < aio_nr) {
-		spin_unlock_bh(&aio_nr_lock);
+		spin_unlock(&aio_nr_lock);
 		goto out_cleanup;
 	}
 	aio_nr += ctx->max_reqs;
