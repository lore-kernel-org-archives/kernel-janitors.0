From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Sep 2019 09:40:52 +0000
Subject: [PATCH][V2] staging: exfat: remove return and error return via a goto
Message-Id: <20190902094052.28029-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The return statement is incorrect, the error exit should be by
assigning ret with the error code and exiting via label out.
Thanks to Valdis Kl=C4=93tnieks for correcting my original fix.

Addresses-Coverity: ("Structurally dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: exit via the got rather than returning via the return statement

---
 drivers/staging/exfat/exfat_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/ex=
fat_super.c
index 5b5c2ca8c9aa..8c2130cc431b 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -664,7 +664,7 @@ static int ffsLookupFile(struct inode *inode, char *pat=
h, struct file_id_t *fid)
 	dentry =3D p_fs->fs_func->find_dir_entry(sb, &dir, &uni_name, num_entries,
 					       &dos_name, TYPE_ALL);
 	if (dentry < -1) {
-		return FFS_NOTFOUND;
+		ret =3D FFS_NOTFOUND;
 		goto out;
 	}
=20
--=20
2.20.1
