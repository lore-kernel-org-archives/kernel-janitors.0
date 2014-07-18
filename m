From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Fri, 18 Jul 2014 15:35:25 +0000
Subject: [PATCH 5/5] fs/ubifs/{sb,super}.c: drop negativity check on unsigned value
Message-Id: <1405697725-23866-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Andrey Utkin <andrey.krieger.utkin@gmail.com>, adrian.hunter@intel.com, dcb314@hotmail.com, dedekind1@gmail.com

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80581
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 fs/ubifs/sb.c    | 2 +-
 fs/ubifs/super.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 4c37607..c2c3d13 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -447,7 +447,7 @@ static int validate_sb(struct ubifs_info *c, struct ubi=
fs_sb_node *sup)
 		goto failed;
 	}
=20
-	if (c->default_compr < 0 || c->default_compr >=3D UBIFS_COMPR_TYPES_CNT) {
+	if (c->default_compr >=3D UBIFS_COMPR_TYPES_CNT) {
 		err =3D 13;
 		goto failed;
 	}
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index e5bd068..9c59c10 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -75,7 +75,7 @@ static int validate_inode(struct ubifs_info *c, const str=
uct inode *inode)
 		return 1;
 	}
=20
-	if (ui->compr_type < 0 || ui->compr_type >=3D UBIFS_COMPR_TYPES_CNT) {
+	if (ui->compr_type >=3D UBIFS_COMPR_TYPES_CNT) {
 		ubifs_err("unknown compression type %d", ui->compr_type);
 		return 2;
 	}
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
