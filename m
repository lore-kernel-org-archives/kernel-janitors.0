From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Sep 2014 16:18:33 +0000
Subject: [PATCH 5/7] staging: lustre: obdclass: expand double GOTO macros
Message-Id: <1410106715-9573-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, "Dilger, Andreas" <andreas.dilger@intel.com>, "Drokin, Oleg" <oleg.drokin@intel.com>, Peng Tao <bergwolf@gmail.com>

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier lbl;
@@

if (...)
  GOTO(lbl,...);
+else
GOTO(lbl,...);

@@
identifier lbl;
expression e,e1,e2;
@@

if (e)
-  GOTO(lbl,e1);
-else GOTO(lbl,e2);
+  e1;
+else e2;
+goto lbl;

@@
identifier lbl1,lbl2;
expression e,e1,e2;
@@

+ e1=E2;
if (e)
-  GOTO(lbl1,e1=E2);
-GOTO(lbl2,e1=E2);
+  goto lbl1;
+goto lbl2;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/obdclass/dt_object.c |    6 ++++--
 drivers/staging/lustre/lustre/obdclass/llog.c      |    5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/lustre/lustre/obdclass/dt_object.c b/drivers/s=
taging/lustre/lustre/obdclass/dt_object.c
index 130b8dd..4060173 100644
--- a/drivers/staging/lustre/lustre/obdclass/dt_object.c
+++ b/drivers/staging/lustre/lustre/obdclass/dt_object.c
@@ -689,8 +689,10 @@ static int dt_index_page_build(const struct lu_env *en=
v, union lu_page *lp,
=20
 		if (nob < size) {
 			if (lip->lip_nr =3D 0)
-				GOTO(out, rc =3D -EINVAL);
-			GOTO(out, rc =3D 0);
+				rc =3D -EINVAL;
+			else
+				rc =3D 0;
+			goto out;
 		}
=20
 		if ((ii->ii_flags & II_FL_NOHASH) =3D 0) {
diff --git a/drivers/staging/lustre/lustre/obdclass/llog.c b/drivers/stagin=
g/lustre/lustre/obdclass/llog.c
index ebdc42f..1cf604d 100644
--- a/drivers/staging/lustre/lustre/obdclass/llog.c
+++ b/drivers/staging/lustre/lustre/obdclass/llog.c
@@ -336,9 +336,10 @@ repeat:
=20
 			if (rec->lrh_index =3D 0) {
 				/* probably another rec just got added? */
+				rc =3D 0;
 				if (index <=3D loghandle->lgh_last_idx)
-					GOTO(repeat, rc =3D 0);
-				GOTO(out, rc =3D 0); /* no more records */
+					goto repeat;
+				goto out; /* no more records */
 			}
 			if (rec->lrh_len =3D 0 ||
 			    rec->lrh_len > LLOG_CHUNK_SIZE) {
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
