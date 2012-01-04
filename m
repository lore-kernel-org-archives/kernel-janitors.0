From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 07:19:31 +0000
Subject: [patch] gfs2: make some sizes unsigned in set_recover_size()
Message-Id: <20120104071931.GC30978@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Whitehouse <swhiteho@redhat.com>, David Teigland <teigland@redhat.com>
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

ls->ls_recover_size is uint32_t so old_size and new_size should be
unsigned as well.  Otherwise a large value could count as a negative
and we could get past the "if (old_size >= max_jid + 1)" check by
mistake.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 82c82d0..400d041 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -886,7 +886,8 @@ static int set_recover_size(struct gfs2_sbd *sdp, struct dlm_slot *slots,
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
 	uint32_t *submit = NULL;
 	uint32_t *result = NULL;
-	int i, max_jid, old_size, new_size;
+	uint32_t old_size, new_size;
+	int i, max_jid;
 
 	max_jid = 0;
 	for (i = 0; i < num_slots; i++) {
