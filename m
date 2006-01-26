From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 17:20:32 +0000
Subject: [KJ] [Patch 5/8] BUG_ON() Conversion in fs/dquot.c
Message-Id: <1138296032.9170.24.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78724712685825249=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78724712685825249==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/dquot.c.orig	2006-01-26 17:55:57.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/dquot.c	2006-01-26 17:56:34.000000000 +0100
@@ -420,8 +420,7 @@ static void invalidate_dquots(struct sup
 		if (dquot->dq_type != type)
 			continue;
 #ifdef __DQUOT_PARANOIA
-		if (atomic_read(&dquot->dq_count))
-			BUG();
+		BUG_ON(atomic_read(&dquot->dq_count));
 #endif
 		/* Quota now has no users and it has been written on last dqput() */
 		remove_dquot_hash(dquot);
@@ -560,8 +559,7 @@ we_slept:
 	atomic_dec(&dquot->dq_count);
 #ifdef __DQUOT_PARANOIA
 	/* sanity check */
-	if (!list_empty(&dquot->dq_free))
-		BUG();
+	BUG_ON(!list_empty(&dquot->dq_free));
 #endif
 	put_dquot_last(dquot);
 	spin_unlock(&dq_list_lock);
@@ -635,8 +633,7 @@ we_slept:
 		return NODQUOT;
 	}
 #ifdef __DQUOT_PARANOIA
-	if (!dquot->dq_sb)	/* Has somebody invalidated entry under us? */
-		BUG();
+	BUG_ON(!dquot->dq_sb);	/* Has somebody invalidated entry under us? */
 #endif
 
 	return dquot;



--===============78724712685825249==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78724712685825249==--
