From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Jan 2017 15:02:30 +0000
Subject: [PATCH 05/46] selinux: Adjust four checks for null pointers
Message-Id: <44727e74-99ac-b0bd-2d7b-e5928d77ea75@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
In-Reply-To: <ca34123f-ced6-d2bc-363b-690858618827@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov, Eric Paris <eparis@parisplace.org>, James Morris <james.l.morris@oracle.com>, Paul Moore <paul@paul-moore.com>, "Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <sds@tycho.nsa.gov>, William Roberts <william.c.roberts@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Jan 2017 12:36:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/selinux/ss/hashtab.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/security/selinux/ss/hashtab.c b/security/selinux/ss/hashtab.c
index dc99fff64ecb..3858706a29fb 100644
--- a/security/selinux/ss/hashtab.c
+++ b/security/selinux/ss/hashtab.c
@@ -17,7 +17,7 @@ struct hashtab *hashtab_create(u32 (*hash_value)(struct h=
ashtab *h, const void *
 	u32 i;
=20
 	p =3D kzalloc(sizeof(*p), GFP_KERNEL);
-	if (p =3D NULL)
+	if (!p)
 		return p;
=20
 	p->size =3D size;
@@ -25,7 +25,7 @@ struct hashtab *hashtab_create(u32 (*hash_value)(struct h=
ashtab *h, const void *
 	p->hash_value =3D hash_value;
 	p->keycmp =3D keycmp;
 	p->htable =3D kmalloc_array(size, sizeof(*p->htable), GFP_KERNEL);
-	if (p->htable =3D NULL) {
+	if (!p->htable) {
 		kfree(p);
 		return NULL;
 	}
@@ -58,7 +58,7 @@ int hashtab_insert(struct hashtab *h, void *key, void *da=
tum)
 		return -EEXIST;
=20
 	newnode =3D kzalloc(sizeof(*newnode), GFP_KERNEL);
-	if (newnode =3D NULL)
+	if (!newnode)
 		return -ENOMEM;
 	newnode->key =3D key;
 	newnode->datum =3D datum;
@@ -87,7 +87,7 @@ void *hashtab_search(struct hashtab *h, const void *key)
 	while (cur && h->keycmp(h, key, cur->key) > 0)
 		cur =3D cur->next;
=20
-	if (cur =3D NULL || (h->keycmp(h, key, cur->key) !=3D 0))
+	if (!cur || (h->keycmp(h, key, cur->key) !=3D 0))
 		return NULL;
=20
 	return cur->datum;
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
