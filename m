From: =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster@gmx.de>
Date: Mon, 13 Dec 2010 18:12:54 +0000
Subject: [PATCH] checkpatch.pl: ERROR: spaces required
Message-Id: <1292263974-15363-1-git-send-email-toralf.foerster@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster@gmx.de>


Signed-off-by: Toralf F=C3=B6rster <toralf.foerster@gmx.de>
---
 kernel/acct.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/kernel/acct.c b/kernel/acct.c
index fa7eb3d..9ca7be8 100644
--- a/kernel/acct.c
+++ b/kernel/acct.c
@@ -144,7 +144,7 @@ static int check_free_space(struct bsd_acct_struct *acc=
t, struct file *file)
 	spin_lock(&acct_lock);
 	if (file !=3D acct->file) {
 		if (act)
-			res =3D act>0;
+			res =3D act > 0;
 		goto out;
 	}
=20
@@ -396,7 +396,7 @@ static comp_t encode_comp_t(unsigned long value)
 	return exp;
 }
=20
-#if ACCT_VERSION=3D1 || ACCT_VERSION=3D2
+#if ACCT_VERSION =3D 1 || ACCT_VERSION =3D 2
 /*
  * encode an u64 into a comp2_t (24 bits)
  *
@@ -440,7 +440,7 @@ static comp2_t encode_comp2_t(u64 value)
 }
 #endif
=20
-#if ACCT_VERSION=3D3
+#if ACCT_VERSION =3D 3
 /*
  * encode an u64 into a 32 bit IEEE float
  */
@@ -449,8 +449,8 @@ static u32 encode_float(u64 value)
 	unsigned exp =3D 190;
 	unsigned u;
=20
-	if (value=3D0) return 0;
-	while ((s64)value > 0){
+	if (value =3D 0) return 0;
+	while ((s64)value > 0) {
 		value <<=3D 1;
 		exp--;
 	}
@@ -510,13 +510,13 @@ static void do_acct_process(struct bsd_acct_struct *a=
cct,
 		       + current->group_leader->start_time.tv_nsec;
 	/* convert nsec -> AHZ */
 	elapsed =3D nsec_to_AHZ(run_time);
-#if ACCT_VERSION=3D3
+#if ACCT_VERSION =3D 3
 	ac.ac_etime =3D encode_float(elapsed);
 #else
 	ac.ac_etime =3D encode_comp_t(elapsed < (unsigned long) -1l ?
 	                       (unsigned long) elapsed : (unsigned long) -1l);
 #endif
-#if ACCT_VERSION=3D1 || ACCT_VERSION=3D2
+#if ACCT_VERSION =3D 1 || ACCT_VERSION =3D 2
 	{
 		/* new enlarged etime field */
 		comp2_t etime =3D encode_comp2_t(elapsed);
@@ -529,15 +529,15 @@ static void do_acct_process(struct bsd_acct_struct *a=
cct,
 	/* we really need to bite the bullet and change layout */
 	ac.ac_uid =3D orig_cred->uid;
 	ac.ac_gid =3D orig_cred->gid;
-#if ACCT_VERSION=3D2
+#if ACCT_VERSION =3D 2
 	ac.ac_ahz =3D AHZ;
 #endif
-#if ACCT_VERSION=3D1 || ACCT_VERSION=3D2
+#if ACCT_VERSION =3D 1 || ACCT_VERSION =3D 2
 	/* backward-compatible 16 bit fields */
 	ac.ac_uid16 =3D ac.ac_uid;
 	ac.ac_gid16 =3D ac.ac_gid;
 #endif
-#if ACCT_VERSION=3D3
+#if ACCT_VERSION =3D 3
 	ac.ac_pid =3D task_tgid_nr_ns(current, ns);
 	rcu_read_lock();
 	ac.ac_ppid =3D task_tgid_nr_ns(rcu_dereference(current->real_parent), ns);
--=20
1.7.2.2

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
