From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Wed, 14 Dec 2005 12:49:59 +0000
Subject: Re: [KJ] [Patch] check u32 < 0 in cpufreq-nforce2
Message-Id: <9a8748490512140449g461b19d9s3615ed5a56caa204@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134563209.23516.2.camel@alice>
In-Reply-To: <1134563209.23516.2.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/14/05, Eric Sesterhenn / snakebyte <snakebyte@gmx.de> wrote:
> Hi,
>
> arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c declares
> pll as u32 which is unsigned, and checks it agains < 0.
> This patch changes it from u32 to s32 so the check
> makes sense, nforce2_write_pll() and nforce2_calc_pll()
> also expect/return a signed int.
>
> Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>
>
> --- arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c.orig 2005-12-14 13:19:43.000000000 +0100
> +++ arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c      2005-12-14 13:23:40.000000000 +0100

Please make patches that can be applied with  patch -p1  that is, run
diff from the directory holding the kernel source dir, not from within
the kernel source dir itself. Also, unless creating your diff that way
makes it obvious what version of the kernel you are patching, please
state the version in your email.


> @@ -177,7 +177,8 @@ static unsigned int nforce2_fsb_read(int
>   */
>  static int nforce2_set_fsb(unsigned int fsb)
>  {
> -       u32 pll, temp = 0;
> +       u32 temp = 0;
> +       s32 pll;
>         unsigned int tfsb;
>         int diff;
>

nforce2_calc_pll() which is used to obtain the value stored in the pll
variable returns a plain 'int', and nforce2_write_pll() which the
value is later passed to also expects a plain 'int', so why not make
the type of pll a plain int instead of s32 ??

Other than that, I agree with you that the variable needs to be signed
since nforce2_calc_pll() returns -1 on failure.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
