From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 12:49:15 +0000
Subject: [KJ] [Patch 3/4] BUG_ON() Conversion in ipc/util.c
Message-Id: <1138366155.15909.9.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68902284742792241=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138366151.15909.8.camel@alice>
In-Reply-To: <1138366151.15909.8.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============68902284742792241==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/ipc/util.c.orig	2006-01-27 11:13:20.000000000 +0100
+++ linux-2.6.16-rc1-git4/ipc/util.c	2006-01-27 11:13:39.000000000 +0100
@@ -265,8 +265,7 @@ struct kern_ipc_perm* ipc_rmid(struct ip
 {
 	struct kern_ipc_perm* p;
 	int lid = id % SEQ_MULTIPLIER;
-	if(lid >= ids->entries->size)
-		BUG();
+	BUG_ON(lid >= ids->entries->size);
 
 	/* 
 	 * do not need a rcu_dereference()() here to force ordering
@@ -274,8 +273,7 @@ struct kern_ipc_perm* ipc_rmid(struct ip
 	 */	
 	p = ids->entries->p[lid];
 	ids->entries->p[lid] = NULL;
-	if(p==NULL)
-		BUG();
+	BUG_ON(p==NULL);
 	ids->in_use--;
 
 	if (lid == ids->max_id) {



--===============68902284742792241==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68902284742792241==--
