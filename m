From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 22 Nov 2005 21:46:01 +0000
Subject: Re: [KJ] [PATCH] selinux: use ARRAY_SIZE macro
Message-Id: <20051122214601.GA1839@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58430736749541001=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051122202321.011911d5@lucky.kitzblitz>
In-Reply-To: <20051122202321.011911d5@lucky.kitzblitz>
To: kernel-janitors@vger.kernel.org

--===============58430736749541001==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2005-11-22 at 20:23:21 +0100, Nicolas Kaiser <nikai@nikai.net> wrote:
> Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]).

You missed two of them (at least your subjects tells you did the whole
security/selinux)

Updated patch attached.

BTW: I've got a whole lot of these hanging here for various areas. I
just need some time to submit them. :-/

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 selinuxfs.c   |    4 ++--
 ss/avtab.c    |    2 +-
 ss/policydb.c |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff -urpN -X dontdiff linux-2.6.15-rc2/security/selinux/selinuxfs.c linux-2.6.15-rc2~array_size/security/selinux/selinuxfs.c
--- linux-2.6.15-rc2/security/selinux/selinuxfs.c	2005-11-20 13:27:41.000000000 +0100
+++ linux-2.6.15-rc2~array_size/security/selinux/selinuxfs.c	2005-11-22 22:37:53.000000000 +0100
@@ -376,7 +376,7 @@ static ssize_t selinux_transaction_write
 	char *data;
 	ssize_t rv;
 
-	if (ino >= sizeof(write_op)/sizeof(write_op[0]) || !write_op[ino])
+	if (ino >= ARRAY_SIZE(write_op) || !write_op[ino])
 		return -EINVAL;
 
 	data = simple_transaction_get(file, buf, size);
@@ -1161,7 +1161,7 @@ static int sel_make_avc_files(struct den
 #endif
 	};
 
-	for (i = 0; i < sizeof (files) / sizeof (files[0]); i++) {
+	for (i = 0; i < ARRAY_SIZE(files); i++) {
 		struct inode *inode;
 		struct dentry *dentry;
 
diff -urpN -X dontdiff linux-2.6.15-rc2/security/selinux/ss/avtab.c linux-2.6.15-rc2~array_size/security/selinux/ss/avtab.c
--- linux-2.6.15-rc2/security/selinux/ss/avtab.c	2005-10-28 08:56:28.000000000 +0200
+++ linux-2.6.15-rc2~array_size/security/selinux/ss/avtab.c	2005-11-22 22:39:18.000000000 +0100
@@ -359,7 +359,7 @@ int avtab_read_item(void *fp, u32 vers, 
 			return -1;
 		}
 
-		for (i = 0; i < sizeof(spec_order)/sizeof(u16); i++) {
+		for (i = 0; i < ARRAY_SIZE(spec_order); i++) {
 			if (val & spec_order[i]) {
 				key.specified = spec_order[i] | enabled;
 				datum.data = le32_to_cpu(buf32[items++]);
diff -urpN -X dontdiff linux-2.6.15-rc2/security/selinux/ss/policydb.c linux-2.6.15-rc2~array_size/security/selinux/ss/policydb.c
--- linux-2.6.15-rc2/security/selinux/ss/policydb.c	2005-11-20 13:27:41.000000000 +0100
+++ linux-2.6.15-rc2~array_size/security/selinux/ss/policydb.c	2005-11-22 22:39:51.000000000 +0100
@@ -103,7 +103,7 @@ static struct policydb_compat_info *poli
 	int i;
 	struct policydb_compat_info *info = NULL;
 
-	for (i = 0; i < sizeof(policydb_compat)/sizeof(*info); i++) {
+	for (i = 0; i < ARRAY_SIZE(policydb_compat); i++) {
 		if (policydb_compat[i].version == version) {
 			info = &policydb_compat[i];
 			break;

--===============58430736749541001==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58430736749541001==--
