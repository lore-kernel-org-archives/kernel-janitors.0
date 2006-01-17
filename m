From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 17 Jan 2006 22:24:02 +0000
Subject: Re: [KJ] [Patch] change if() BUG();
Message-Id: <20060117222402.GA31221@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18624130421488383=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1137533116.20230.15.camel@alice>
In-Reply-To: <1137533116.20230.15.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============18624130421488383==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 17, 2006 at 10:25:11PM +0100, Eric Sesterhenn / snakebyte wrote:
> this patch changes the if() BUG(); construct in
> drivers/net/ixgb/ixgb_osdep.h to a BUG_ON; so defining
> BUG to a no-op is safe.

> --- linux-2.6.15-git11/drivers/net/ixgb/ixgb_osdep.h.orig
> +++ linux-2.6.15-git11/drivers/net/ixgb/ixgb_osdep.h
> @@ -60,7 +60,7 @@ typedef enum {
>  } boolean_t;
>
>  #undef ASSERT
> -#define ASSERT(x)	if(!(x)) BUG()
> +#define ASSERT(x)	BUG_ON(!(x))

Naah. Just Drop It (TM).


--===============18624130421488383==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18624130421488383==--
