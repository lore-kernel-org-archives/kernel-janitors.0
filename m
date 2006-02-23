From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Feb 2006 00:05:05 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/afs
Message-Id: <1140653105.5833.7.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23312860008718683=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23312860008718683==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/afs to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/afs/vlocation.c.orig	2006-02-23 00:39:37.000000000 +0100
+++ linux-2.6.16-rc4/fs/afs/vlocation.c	2006-02-23 00:40:24.000000000 +0100
@@ -281,11 +281,10 @@ int afs_vlocation_lookup(struct afs_cell
 	spin_unlock(&cell->vl_gylock);
 
 	/* not in the cell's in-memory lists - create a new record */
-	vlocation = kmalloc(sizeof(struct afs_vlocation), GFP_KERNEL);
+	vlocation = kzalloc(sizeof(struct afs_vlocation), GFP_KERNEL);
 	if (!vlocation)
 		return -ENOMEM;
 
-	memset(vlocation, 0, sizeof(struct afs_vlocation));
 	atomic_set(&vlocation->usage, 1);
 	INIT_LIST_HEAD(&vlocation->link);
 	rwlock_init(&vlocation->lock);
--- linux-2.6.16-rc4/fs/afs/volume.c.orig	2006-02-23 00:38:39.000000000 +0100
+++ linux-2.6.16-rc4/fs/afs/volume.c	2006-02-23 00:38:55.000000000 +0100
@@ -186,11 +186,10 @@ int afs_volume_lookup(const char *name, 
 	_debug("creating new volume record");
 
 	ret = -ENOMEM;
-	volume = kmalloc(sizeof(struct afs_volume), GFP_KERNEL);
+	volume = kzalloc(sizeof(struct afs_volume), GFP_KERNEL);
 	if (!volume)
 		goto error_up;
 
-	memset(volume, 0, sizeof(struct afs_volume));
 	atomic_set(&volume->usage, 1);
 	volume->type		= type;
 	volume->type_force	= force;



--===============23312860008718683==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23312860008718683==--
