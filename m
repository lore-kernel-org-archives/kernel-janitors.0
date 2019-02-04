From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Feb 2019 18:24:21 +0000
Subject: [PATCH v2] mm/hmm: potential deadlock in nonblocking code
Message-Id: <20190204182304.GA8756@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190204132043.GA16485@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>

There is a deadlock bug when these functions are used in nonblocking
mode.

The else side of the if/else statement is only meant to be taken in when
the code is used in blocking mode.  But, unfortunately, the way the
code is now, if we're in non-blocking mode and we succeed in taking the
lock then we do the else statement.  The else side tries to take lock a
second time which results in a deadlock.

Fixes: a3402cb621c1 ("mm/hmm: improve driver API to work and wait over a range")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
V2: improve the style and tweak the commit description

 hmm.c |   15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index e14e0aa4d2cb..3c9781037918 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -207,11 +207,12 @@ static int hmm_invalidate_range_start(struct mmu_notifier *mn,
 	update.event = HMM_UPDATE_INVALIDATE;
 	update.blockable = nrange->blockable;
 
-	if (!nrange->blockable && !mutex_trylock(&hmm->lock)) {
+	if (nrange->blockable)
+		mutex_lock(&hmm->lock);
+	else if (!mutex_trylock(&hmm->lock)) {
 		ret = -EAGAIN;
 		goto out;
-	} else
-		mutex_lock(&hmm->lock);
+	}
 	hmm->notifiers++;
 	list_for_each_entry(range, &hmm->ranges, list) {
 		if (update.end < range->start || update.start >= range->end)
@@ -221,12 +222,12 @@ static int hmm_invalidate_range_start(struct mmu_notifier *mn,
 	}
 	mutex_unlock(&hmm->lock);
 
-
-	if (!nrange->blockable && !down_read_trylock(&hmm->mirrors_sem)) {
+	if (nrange->blockable)
+		down_read(&hmm->mirrors_sem);
+	else if (!down_read_trylock(&hmm->mirrors_sem)) {
 		ret = -EAGAIN;
 		goto out;
-	} else
-		down_read(&hmm->mirrors_sem);
+	}
 	list_for_each_entry(mirror, &hmm->mirrors, list) {
 		int ret;
 
