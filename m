From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 14 Dec 2005 12:58:14 +0000
Subject: Re: [KJ] [Patch] check u32 < 0 in cpufreq-nforce2
Message-Id: <1134565094.23689.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77862087781608391=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134563209.23516.2.camel@alice>
In-Reply-To: <1134563209.23516.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============77862087781608391==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

thanks for the reply

> Please make patches that can be applied with  patch -p1  that is, run
> diff from the directory holding the kernel source dir, not from within
> the kernel source dir itself. Also, unless creating your diff that way
> makes it obvious what version of the kernel you are patching, please
> state the version in your email.

ok, rediffed, kernel ist 2.6.16-rc5-git2

> nforce2_calc_pll() which is used to obtain the value stored in the pll
> variable returns a plain 'int', and nforce2_write_pll() which the
> value is later passed to also expects a plain 'int', so why not make
> the type of pll a plain int instead of s32 ??

i wasnt brave enough, since i am not fully aware of the differences 
between s32 and int. changed it to int.

> Other than that, I agree with you that the variable needs to be signed
> since nforce2_calc_pll() returns -1 on failure.

so such cleanups are ok? the icc compiler spits out some more warnings
regarding this ( not all seem to be a problem ).


Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git2/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c.orig	2005-12-14 13:19:43.000000000 +0100
+++ linux-2.6.15-rc5-git2/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c	2005-12-14 13:55:06.000000000 +0100
@@ -177,9 +177,9 @@ static unsigned int nforce2_fsb_read(int
  */
 static int nforce2_set_fsb(unsigned int fsb)
 {
-	u32 pll, temp = 0;
+	u32 temp = 0;
 	unsigned int tfsb;
-	int diff;
+	int diff, pll;
 
 	if ((fsb > max_fsb) || (fsb < NFORCE2_MIN_FSB)) {
 		printk(KERN_ERR "cpufreq: FSB %d is out of range!\n", fsb);



--===============77862087781608391==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77862087781608391==--
