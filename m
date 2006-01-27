From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 12:49:11 +0000
Subject: [KJ] [Patch 3/4] BUG_ON() Conversion in ipc/shm.c
Message-Id: <1138366151.15909.8.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70690385847944825=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70690385847944825==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/ipc/shm.c.orig	2006-01-27 11:11:02.000000000 +0100
+++ linux-2.6.16-rc1-git4/ipc/shm.c	2006-01-27 11:13:11.000000000 +0100
@@ -90,8 +90,8 @@ static inline int shm_addid(struct shmid
 static inline void shm_inc (int id) {
 	struct shmid_kernel *shp;
 
-	if(!(shp = shm_lock(id)))
-		BUG();
+	shp = shm_lock(id);
+	BUG_ON(!shp);
 	shp->shm_atim = get_seconds();
 	shp->shm_lprid = current->tgid;
 	shp->shm_nattch++;
@@ -141,8 +141,8 @@ static void shm_close (struct vm_area_st
 
 	down (&shm_ids.sem);
 	/* remove from the list of attaches of the shm segment */
-	if(!(shp = shm_lock(id)))
-		BUG();
+	shp = shm_lock(id);
+	BUG_ON(!shp);
 	shp->shm_lprid = current->tgid;
 	shp->shm_dtim = get_seconds();
 	shp->shm_nattch--;
@@ -282,8 +282,7 @@ asmlinkage long sys_shmget (key_t key, s
 		err = -EEXIST;
 	} else {
 		shp = shm_lock(id);
-		if(shp==NULL)
-			BUG();
+		BUG_ON(shp==NULL);
 		if (shp->shm_segsz < size)
 			err = -EINVAL;
 		else if (ipcperms(&shp->shm_perm, shmflg))
@@ -772,8 +771,8 @@ invalid:
 	up_write(&current->mm->mmap_sem);
 
 	down (&shm_ids.sem);
-	if(!(shp = shm_lock(shmid)))
-		BUG();
+	shp = shm_lock(shmid);
+	BUG_ON(!shp);
 	shp->shm_nattch--;
 	if(shp->shm_nattch == 0 &&
 	   shp->shm_perm.mode & SHM_DEST)



--===============70690385847944825==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70690385847944825==--
