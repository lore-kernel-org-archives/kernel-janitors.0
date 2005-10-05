From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 05 Oct 2005 21:21:25 +0000
Subject: Re: [KJ] hexdigits definition consolidation [RESEND2]
Message-Id: <20051005212124.GC27229@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9122499933451973=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051005201210.GA27788@masoud.ir>
In-Reply-To: <20051005201210.GA27788@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============9122499933451973==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 05, 2005 at 04:12:11PM -0400, Masoud Sharbiani wrote:
> On Wed, Oct 05, 2005 at 11:25:33AM -0600, Matthew Wilcox wrote:
> >  - Instead of introducing a new lib file and a new header file, how
> >    about exporting all this via vsprintf.c and <linux/kernel.h>?
>
> Also done.
>
> >  - I prefer the longer names 'hexchar' to just 'hex'.
>
> How about small_digits and large_digits that are already there in
> lib/vsprint.c?

Sounds sane.

> >  - A lot of these look like open coded versions of using
> >    sprintf(dest, "%x", arg);
> >  - Some seem to be unnecessary implementations of common library
> >    functions.  eg gdb_cris_strtol() could use simple_strtol() instead.
>
> I'll hopefully do this one in a separate patch hopefully tomorrow.

> --- linux-2.6.clean/arch/cris/arch-v10/kernel/kgdb.c
> +++ linux-2.6.patched/arch/cris/arch-v10/kernel/kgdb.c

Please, add "-p" to your diff(1) flags. It'd sometimes make reviewing
much easier.

> @@ -557,8 +556,8 @@
>  	char *sd;
>  	int x = 0;
>  	
> -	for (s1 = (char*)s; (sd = gdb_cris_memchr(hexchars, *s1, base)) != NULL; ++s1)
> -		x = x * base + (sd - hexchars);
> +	for (s1 = (char*)s; (sd = gdb_cris_memchr(small_digits, *s1, base)) != NULL; ++s1)
> +		x = x * base + (sd - small_digits);
>          
>          if (endptr)
>          {

simple_strtol()

> --- linux-2.6.clean/arch/cris/arch-v32/kernel/kgdb.c
> +++ linux-2.6.patched/arch/cris/arch-v32/kernel/kgdb.c
> @@ -550,8 +549,8 @@
>  	char *sd;
>  	int x = 0;
>  
> -	for (s1 = (char*)s; (sd = gdb_cris_memchr(hexchars, *s1, base)) != NULL; ++s1)
> -		x = x * base + (sd - hexchars);
> +	for (s1 = (char*)s; (sd = gdb_cris_memchr(small_digits, *s1, base)) != NULL; ++s1)
> +		x = x * base + (sd - small_digits);
>  
>          if (endptr) {
>                  /* Unconverted suffix is stored in endptr unless endptr is NULL. */

simple_strtol().

Hmmm... Why do we have multiple copies of kgdb stuff lying around?

> @@ -660,7 +659,7 @@
>  static inline char
>  highhex(int x)
>  {
> -	return hexchars[(x >> 4) & 0xf];
> +	return small_digits[(x >> 4) & 0xf];
>  }
> @@ -668,7 +667,7 @@
>  static inline char
>  lowhex(int x)
>  {
> -	return hexchars[x & 0xf];
> +	return small_digits[x & 0xf];
>  }

Possibly worth moving to include/linux/ leaving as static inline. Or
removing:

	small_digits[x >> 4];
	small_digits[x & 0xf];

It isn't hard to guess what the above means. Don't know what is better.

> +			output_buffer[2] = small_digits[sigval & 0xf];
>  			output_buffer[3] = 0;
>  			break;
>  
> --- linux-2.6.clean/arch/ppc/boot/common/misc-common.c	2005-10-05 14:11:56.000000000 -0400
> +++ linux-2.6.patched/arch/ppc/boot/common/misc-common.c	2005-10-05 14:23:49.000000000 -0400
> @@ -280,7 +280,7 @@
>  	int i;
>  	for (i = 7;  i >= 0;  i--)
>  	{
> -		buf[i] = "0123456789ABCDEF"[val & 0x0F];
> +		buf[i] = small_digits[val & 0x0F];
>  		val >>= 4;
>  	}
>  	buf[8] = '\0';
> @@ -362,13 +362,13 @@
>  						sign = '-';
>  						val = -val;
>  					}
> -					length = _cvt(val, buf, 10, "0123456789");
> +					length = _cvt(val, buf, 10, decimal);
>  					break;
>  				case 'x':
> -					length = _cvt(val, buf, 16, "0123456789abcdef");
> +					length = _cvt(val, buf, 16, hex);
>  					break;
>  				case 'X':
> -					length = _cvt(val, buf, 16, "0123456789ABCDEF");
> +					length = _cvt(val, buf, 16, HEX);
>  					break;
>  				}
>  				cp = buf;

Both _vprintk() and _cvt should die.

> --- linux-2.6.clean/drivers/net/sk98lin/skge.c
> +++ linux-2.6.patched/drivers/net/sk98lin/skge.c
> @@ -4858,7 +4857,7 @@
> -char	HEXCHAR[] = "0123456789ABCDEF";
> +char	large_digits[] = "0123456789ABCDEF";

Just remove it.

> --- linux-2.6.clean/drivers/pnp/pnpbios/rsparser.c
> +++ linux-2.6.patched/drivers/pnp/pnpbios/rsparser.c
> @@ -481,8 +481,6 @@
>  
>  void pnpid32_to_pnpid(u32 id, char *str)
>  {
> -	const char *hex = "0123456789abcdef";
> -
>  	id = be32_to_cpu(id);
>  	str[0] = CHAR(id, 26);
>  	str[1] = CHAR(id, 21);

This won't fly. See macros several lines above. Compile-test before
sending.

> --- linux-2.6.clean/drivers/scsi/ibmmca.c
> +++ linux-2.6.patched/drivers/scsi/ibmmca.c
> @@ -1007,7 +1007,6 @@
>  /* interpreter for logical device numbers (ldn) */
>  static char *ti_l(int val)
>  {
> -	const char hex[16] = "0123456789abcdef";
>  	static char answer[2];
>  
>  	answer[1] = (char) (0x0);

Ditto.

> --- linux-2.6.clean/lib/vsprintf.c
> +++ linux-2.6.patched/lib/vsprintf.c
> @@ -14,6 +14,9 @@
>   * - changed to provide snprintf and vsnprintf functions
>   * So Feb  1 16:51:32 CET 2004 Juergen Quade <quade@hsnr.de>
>   * - scnprintf and vscnprintf
> + * Oct 5 14:27:25 EDT 2005 Masoud Sharbiani <masouds@masoud.ir>
> + * - Made small_digits and large_digits globals and exported them so that
> + *  all drivers dumping hex values can use them from here.

No need. It's git's job to maintain changelogs.

> +const char small_digits[] = "0123456789abcdefghijklmnopqrstuvwxyz";
> +EXPORT_SYMBOL(small_digits);
> +
> +const char large_digits[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
> +EXPORT_SYMBOL(large_digits);

I guess many people from linux-kernel will shoot us for exporting
_this_.


--===============9122499933451973==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9122499933451973==--
