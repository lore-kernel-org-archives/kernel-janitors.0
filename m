From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:44:04 +0000
Subject: [PATCH 44/46] selinux: Adjust two checks for null pointers
Message-Id: <e12da517-36fb-2247-e9b4-488708d6cda7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 13:30:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/sidtab.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/selinux/ss/sidtab.c b/security/selinux/ss/sidtab.c
index c9533b21942b..f6915f257486 100644
--- a/security/selinux/ss/sidtab.c
+++ b/security/selinux/ss/sidtab.c
@@ -54,7 +54,7 @@ int sidtab_insert(struct sidtab *s, u32 sid, struct conte=
xt *context)
 	}
=20
 	newnode =3D kmalloc(sizeof(*newnode), GFP_ATOMIC);
-	if (newnode =3D NULL) {
+	if (!newnode) {
 		rc =3D -ENOMEM;
 		goto out;
 	}
@@ -98,7 +98,7 @@ static struct context *sidtab_search_core(struct sidtab *=
s, u32 sid, int force)
 	if (force && cur && sid =3D cur->sid && cur->context.len)
 		return &cur->context;
=20
-	if (cur =3D NULL || sid !=3D cur->sid || cur->context.len) {
+	if (!cur || sid !=3D cur->sid || cur->context.len) {
 		/* Remap invalid SIDs to the unlabeled SID. */
 		sid =3D SECINITSID_UNLABELED;
 		hvalue =3D SIDTAB_HASH(sid);
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
