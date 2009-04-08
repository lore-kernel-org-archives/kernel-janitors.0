From: Jack Stone <jwjstone@fastmail.fm>
Date: Wed, 08 Apr 2009 11:22:08 +0000
Subject: [PATCH 36/56] ocfs2: Remove void casts
Message-Id: <1239189748-11703-37-git-send-email-jwjstone@fastmail.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-10-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-11-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-12-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-13-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-14-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-15-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-16-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-17-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-18-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-19-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-20-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-21-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-22-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-23-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-24-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-25-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-26-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-27-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-28-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-29-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-30-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-31-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-32-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-33-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-34-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-35-git-send-email-jwjstone@fastmail.fm>
 <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-36-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: jeff@garzik.org, kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
---
 fs/ocfs2/dlm/dlmmaster.c |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
index f8b653f..e4c2f5b 100644
--- a/fs/ocfs2/dlm/dlmmaster.c
+++ b/fs/ocfs2/dlm/dlmmaster.c
@@ -758,8 +758,7 @@ lookup:
 		spin_unlock(&dlm->spinlock);
 		mlog(0, "allocating a new resource\n");
 		/* nothing found and we need to allocate one. */
-		alloc_mle = (struct dlm_master_list_entry *)
-			kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
+		alloc_mle = kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
 		if (!alloc_mle)
 			goto leave;
 		res = dlm_new_lockres(dlm, lockid, namelen);
@@ -1543,8 +1542,7 @@ way_up_top:
 			spin_unlock(&dlm->master_lock);
 			spin_unlock(&dlm->spinlock);
 
-			mle = (struct dlm_master_list_entry *)
-				kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
+			mle = kmem_cache_alloc(dlm_mle_cache, GFP_NOFS);
 			if (!mle) {
 				response = DLM_MASTER_RESP_ERROR;
 				mlog_errno(-ENOMEM);
@@ -2455,7 +2453,7 @@ static int dlm_migrate_lockres(struct dlm_ctxt *dlm,
 		goto leave;
 	}
 
-	mle = (struct dlm_master_list_entry *) kmem_cache_alloc(dlm_mle_cache,
+	mle = kmem_cache_alloc(dlm_mle_cache,
 								GFP_NOFS);
 	if (!mle) {
 		mlog_errno(ret);
@@ -3036,7 +3034,7 @@ int dlm_migrate_request_handler(struct o2net_msg *msg, u32 len, void *data,
 	hash = dlm_lockid_hash(name, namelen);
 
 	/* preallocate.. if this fails, abort */
-	mle = (struct dlm_master_list_entry *) kmem_cache_alloc(dlm_mle_cache,
+	mle = kmem_cache_alloc(dlm_mle_cache,
 							 GFP_NOFS);
 
 	if (!mle) {
-- 
1.5.4.3

