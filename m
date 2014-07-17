From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 13:27:35 +0000
Subject: [PATCH 2/3] arch/mips/net/bpf_jit.c: fix failure check
Message-Id: <1405603655-12571-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org
Cc: dborkman@redhat.com, markos.chandras@imgtec.com, ralf@linux-mips.org, Andrey Utkin <andrey.krieger.utkin@gmail.com>

static int pkt_type_offset(void) returned -1 in case of failure, and
actual (positive) offset value in case of success. In the only instance
of its usage, the result was saved to local "unsigned int off" variable,
   which is used in a lot of places in the same (large) function, so
   changing its type could cause many warnings.
There was no signed int variable which could be just used for this case.
There are two possibilities to resolve that: to declare temporary signed
int variable to get the return value from pkt_type_offset(), or to
separate return status from returned offset value. The latter approach
was chosen, however, I am not sure which would be practically optimal.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80371
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 arch/mips/net/bpf_jit.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
index b87390a..47f65d5 100644
--- a/arch/mips/net/bpf_jit.c
+++ b/arch/mips/net/bpf_jit.c
@@ -770,7 +770,7 @@ static u64 jit_get_skb_w(struct sk_buff *skb, unsigned =
offset)
 #else
 #define PKT_TYPE_MAX	7
 #endif
-static int pkt_type_offset(void)
+static int pkt_type_offset(unsigned int *off_arg)
 {
 	struct sk_buff skb_probe =3D {
 		.pkt_type =3D ~0,
@@ -779,8 +779,10 @@ static int pkt_type_offset(void)
 	unsigned int off;
=20
 	for (off =3D 0; off < sizeof(struct sk_buff); off++) {
-		if (ct[off] =3D PKT_TYPE_MAX)
-			return off;
+		if (ct[off] =3D PKT_TYPE_MAX) {
+			*off_arg =3D off;
+			return 0;
+		}
 	}
 	pr_err_once("Please fix pkt_type_offset(), as pkt_type couldn't be found\=
n");
 	return -1;
@@ -1332,9 +1334,7 @@ jmp_cmp:
 		case BPF_ANC | SKF_AD_PKTTYPE:
 			ctx->flags |=3D SEEN_SKB;
=20
-			off =3D pkt_type_offset();
-
-			if (off < 0)
+			if (pkt_type_offset(&off))
 				return -1;
 			emit_load_byte(r_tmp, r_skb, off, ctx);
 			/* Keep only the last 3 bits */
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
