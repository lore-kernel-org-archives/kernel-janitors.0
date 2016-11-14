From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Nov 2016 11:34:00 +0000
Subject: [patch] alpha: silence a buffer overflow warning
Message-Id: <20161114113314.GB20543@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We check that "member" is in bounds for the first line, but we also use
it on the next line without checking which is a mistake.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 4811e54..7574377 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -1094,8 +1094,9 @@ get_sysnames(unsigned long type, unsigned long variation, unsigned long cpu,
 	default: /* default to variation "0" for now */
 		break;
 	case ST_DEC_EB164:
-		if (member < ARRAY_SIZE(eb164_indices))
-			*variation_name = eb164_names[eb164_indices[member]];
+		if (member >= ARRAY_SIZE(eb164_indices))
+			break;
+		*variation_name = eb164_names[eb164_indices[member]];
 		/* PC164 may show as EB164 variation, but with EV56 CPU,
 		   so, since no true EB164 had anything but EV5... */
 		if (eb164_indices[member] = 0 && cpu = EV56_CPU)
