From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 11:46:49 +0000
Subject: [patch] dm thin: check kmalloc in dm_deferred_set_create()
Message-Id: <20121002114649.GA1413@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>
Cc: dm-devel@redhat.com, Neil Brown <neilb@suse.de>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

We can simply return NULL here.  The callers already handle that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index da0d5d1..fa7d21e 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -394,6 +394,8 @@ static struct dm_deferred_set *dm_deferred_set_create(void)
 	struct dm_deferred_set *ds;
 
 	ds = kmalloc(sizeof(*ds), GFP_KERNEL);
+	if (!ds)
+		return NULL;
 
 	spin_lock_init(&ds->lock);
 	ds->current_entry = 0;
