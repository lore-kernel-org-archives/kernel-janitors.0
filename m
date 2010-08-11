From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Wed, 11 Aug 2010 01:09:41 +0000
Subject: [PATCH] x86: hpet: clean up warning (hpet_freq)
Message-Id: <1281488981.4423.6.camel@lovely.krouter>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

hpet_freq is (FSEC_PER_NSEC * NSEC_PER_SEC). This patch also fixes the
below compile warning due to recently added preprocessor calculation for
hpet_freq.

arch/x86/kernel/hpet.c: In function =A1hpet_clocksource_register=A2:
arch/x86/kernel/hpet.c:840: warning: integer overflow in expression

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 arch/x86/kernel/hpet.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 33dbcc4..86643ce 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -582,7 +582,7 @@ static void init_one_hpet_msi_clockevent(struct hpet_de=
v *hdev, int cpu)
 	 * scaled math multiplication factor for nanosecond to hpet tick
 	 * conversion.
 	 */
-	hpet_freq =3D 1000000000000000ULL;
+	hpet_freq =3D (uint64_t)FSEC_PER_NSEC * (uint64_t)NSEC_PER_SEC;
 	do_div(hpet_freq, hpet_period);
 	evt->mult =3D div_sc((unsigned long) hpet_freq,
 				      NSEC_PER_SEC, evt->shift);
@@ -837,7 +837,7 @@ static int hpet_clocksource_register(void)
 	 * cyc/sec =3D FSEC_PER_SEC/hpet_period(fsec/cyc)
 	 * cyc/sec =3D (FSEC_PER_NSEC * NSEC_PER_SEC)/hpet_period
 	 */
-	hpet_freq =3D FSEC_PER_NSEC * NSEC_PER_SEC;
+	hpet_freq =3D (u64)FSEC_PER_NSEC * (u64)NSEC_PER_SEC;
 	do_div(hpet_freq, hpet_period);
 	clocksource_register_hz(&clocksource_hpet, (u32)hpet_freq);
=20
--=20
1.7.1



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
