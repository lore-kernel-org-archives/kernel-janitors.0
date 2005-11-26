From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 26 Nov 2005 19:40:10 +0000
Subject: Re: [KJ] [RESEND] [PATCH]
Message-Id: <20051126194009.GA29784@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64265060182281053=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64265060182281053==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 08, 2005 at 07:38:35AM -0500, Gabriel A. Devenyi wrote:
> Thanks to LinuxICC (http://linuxicc.sf.net), a comparison of a u32 less
> than 0 was found, this patch changes the variable to a signed int so that
> comparison is meaningful.

> --- a/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
> +++ b/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
> @@ -177,9 +177,9 @@ static unsigned int nforce2_fsb_read(int
>   */
>  static int nforce2_set_fsb(unsigned int fsb)
>  {
> -	u32 pll, temp = 0;
> +	u32 temp = 0;
>  	unsigned int tfsb;
> -	int diff;
> +	int diff, pll = 0;
		     ^^^^
Real life loadavg decreased significantly and I've dropped this
appear-to-be-useless assignment.

As for ChangleLog entry, sometimes people do

	f(unsigned int foo)
	{
		if (foo < 0 || foo >= MAX_FOO)
			return -EINVAL;

just in case.


--===============64265060182281053==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64265060182281053==--
