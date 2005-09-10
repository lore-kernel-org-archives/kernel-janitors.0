From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 10 Sep 2005 21:48:28 +0000
Subject: Re: [KJ] [PATCH 3/4] drivers/net/wan: Replace custom macro with
Message-Id: <20050910214828.GA8473@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98202555503441902=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050910121859.GD1218@neon.tklauser.home>
In-Reply-To: <20050910121859.GD1218@neon.tklauser.home>
To: kernel-janitors@vger.kernel.org

--===============98202555503441902==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 10, 2005 at 02:18:59PM +0200, Tobias Klauser wrote:
> Replace the custom is_digit()/is_hex_digit() macros with
> isdigit()/isxdigit() from <linux/ctype.h>

> --- linux-2.6.13/drivers/net/wan/cycx_x25.c
> +++ linux-2.6.13~macro_removal/drivers/net/wan/cycx_x25.c

> @@ -1531,7 +1532,7 @@ static unsigned dec_to_uint(u8 *str, int
					^^^^^^^^^^^
> -	for (; len && is_digit(*str); ++str, --len)
> +	for (; len && isdigit(*str); ++str, --len)
>  		val = (val * 10) + (*str - (unsigned) '0');

Removing duplicated code on slightly larger scale would be even better.

$ cat -n drivers/net/wan/cycx_x25.c | head -n 1538 | tail -n 14
  1525	/* Convert decimal string to unsigned integer.
  1526	 * If len != 0 then only 'len' characters of the string are converted. */
  1527	static unsigned dec_to_uint(u8 *str, int len)
  1528	{
  1529		unsigned val = 0;
  1530	
  1531		if (!len)
  1532			len = strlen(str);
  1533	
  1534		for (; len && is_digit(*str); ++str, --len)
  1535			val = (val * 10) + (*str - (unsigned) '0');
  1536	
  1537		return val;
  1538	}

> --- linux-2.6.13/drivers/net/wan/sdla_fr.c
> +++ linux-2.6.13~macro_removal/drivers/net/wan/sdla_fr.c
> @@ -3458,7 +3458,7 @@ static unsigned int dec_to_uint (unsigne
					    ^^^^^^^^^^^
> --- linux-2.6.13/drivers/net/wan/sdla_x25.c
> +++ linux-2.6.13~macro_removal/drivers/net/wan/sdla_x25.c
> @@ -3875,7 +3875,7 @@ static unsigned int dec_to_uint (unsigne
					    ^^^^^^^^^^^
> @@ -3896,9 +3896,9 @@ static unsigned int hex_to_uint (unsigne
					    ^^^^^^^^^^^


--===============98202555503441902==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98202555503441902==--
