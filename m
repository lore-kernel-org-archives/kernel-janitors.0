From: Domen Puncer <domen@coderock.org>
Date: Sat, 19 Feb 2005 21:09:21 +0000
Subject: [KJ] Re: fs/* - compile warning cleanup
Message-Id: <20050219210921.GB3850@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8583419812100761=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8583419812100761==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15/02/05 00:02 +0200, Stephen Biggs wrote:
Content-Description: Mail message body
> Description: compile warning cleanup - handle error return warning from 
> clear_user - the driver writer does not want to check the return value
> 
> Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>
> 
> diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/fs/binfmt_elf.c linux-2.6.11-rc3-mm2/fs/binfmt_elf.c
> --- linux-2.6.11-rc3-mm2-original/fs/binfmt_elf.c	2005-02-12 12:06:39.000000000 +0200
> +++ linux-2.6.11-rc3-mm2/fs/binfmt_elf.c	2005-02-12 13:57:59.000000000 +0200
> @@ -823,11 +823,16 @@ static int load_elf_binary(struct linux_
>  					nbyte = elf_brk - elf_bss;
>  				/*
>  				 * This bss-zeroing can fail if the ELF file
> -				 * specifies odd protections.  So we don't check
> -				 * the return value
> +				 * specifies odd protections, so we don't want to
> +				 * check the return value. However, since clear_user() is
> +				 * declared with attribute 'warn_unused_result', this
> +				 * causes a warning during compilation. Putting (void)
> +				 * before the call to clear_user() doesn't silence the warning.
> +				 * Thus, we need to "trick" the compiler into shutting up.
>  				 */
> -				(void)clear_user((void __user *)elf_bss +
> -							load_bias, nbyte);
> +				if (clear_user((void __user *)elf_bss +
> +							load_bias, nbyte)) {
> +				}

Original comment indicated (void) was there to silence gcc (which
is also quiet here for original code).
Also... you added >80 chars lines.


	Domen

--===============8583419812100761==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8583419812100761==--
