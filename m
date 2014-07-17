From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 14:22:38 +0000
Subject: [PATCH] arch/mips/net/bpf_jit.c: fix failure check
Message-Id: <1405606958-14383-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405603655-12571-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405603655-12571-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org
Cc: dborkman@redhat.com, markos.chandras@imgtec.com, ralf@linux-mips.org, Andrey Utkin <andrey.krieger.utkin@gmail.com>

static int pkt_type_offset(void) returned -1 in case of failure, and actual
(positive) offset value in case of success. In the only instance of its usa=
ge,
the result was saved to local "unsigned int off" variable, which is used in=
 a
lot of places in the same (large) function, so changing its type could cause
many warnings. So new signed int variable was added.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80371
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 arch/mips/net/bpf_jit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
index b87390a..918b341 100644
--- a/arch/mips/net/bpf_jit.c
+++ b/arch/mips/net/bpf_jit.c
@@ -793,6 +793,7 @@ static int build_body(struct jit_ctx *ctx)
 	const struct sock_filter *inst;
 	unsigned int i, off, load_order, condt;
 	u32 k, b_off __maybe_unused;
+	int tmp;
=20
 	for (i =3D 0; i < prog->len; i++) {
 		u16 code;
@@ -1332,9 +1333,9 @@ jmp_cmp:
 		case BPF_ANC | SKF_AD_PKTTYPE:
 			ctx->flags |=3D SEEN_SKB;
=20
-			off =3D pkt_type_offset();
+			tmp =3D off =3D pkt_type_offset();
=20
-			if (off < 0)
+			if (tmp < 0)
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
