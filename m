From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 14 Dec 2005 12:26:49 +0000
Subject: [KJ] [Patch] check u32 < 0 in cpufreq-nforce2
Message-Id: <1134563209.23516.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59133476844968591=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============59133476844968591==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c declares
pll as u32 which is unsigned, and checks it agains < 0.
This patch changes it from u32 to s32 so the check
makes sense, nforce2_write_pll() and nforce2_calc_pll()
also expect/return a signed int.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c.orig	2005-12-14 13:19:43.000000000 +0100
+++ arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c	2005-12-14 13:23:40.000000000 +0100
@@ -177,7 +177,8 @@ static unsigned int nforce2_fsb_read(int
  */
 static int nforce2_set_fsb(unsigned int fsb)
 {
-	u32 pll, temp = 0;
+	u32 temp = 0;
+	s32 pll;
 	unsigned int tfsb;
 	int diff;
 



--===============59133476844968591==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59133476844968591==--
