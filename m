From: Domen Puncer <domen@coderock.org>
Date: Mon, 10 Jan 2005 01:27:44 +0000
Subject: Re: [KJ] [PATCH] radio-sf16fmi cleanup
Message-Id: <20050110012744.GB14307@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36527004979572952=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190530.GA9205@penguin.localdomain>
In-Reply-To: <20041219190530.GA9205@penguin.localdomain>
To: kernel-janitors@vger.kernel.org

--===============36527004979572952==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19/12/04 20:05 +0100, Marcel Sebek wrote:
> This is small cleanup of radio-sf16fmi driver.
> 
> Compile tested.
> 
> Signed-off-by: Marcel Sebek <sebek64@post.cz>
> 
> diff -urNp linux-2.6/drivers/media/radio/radio-sf16fmi.c linux-2.6-new/drivers/media/radio/radio-sf16fmi.c
> --- linux-2.6/drivers/media/radio/radio-sf16fmi.c	2004-09-13 19:44:54.000000000 +0200
> +++ linux-2.6-new/drivers/media/radio/radio-sf16fmi.c	2004-12-18 19:15:02.000000000 +0100
...
> -MODULE_PARM(io, "i");
> +module_param(io, int, 0444);
...

module_param from other folks already got merged.


Care to resend this chunk with removal from kernel-parameters.txt?

> -
> -#ifndef MODULE
> -static int __init fmi_setup_io(char *str)
> -{
> -	get_option(&str, &io);
> -	return 1;
> -}
> -
> -__setup("sf16fm=", fmi_setup_io);
> -#endif

--===============36527004979572952==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36527004979572952==--
