From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Fri, 04 Mar 2005 10:10:18 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <200503041257.17454.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71770060276879444=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============71770060276879444==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wednesday 02 March 2005 11:57, Domen Puncer wrote:

> printk-drivers_acorn_block_mfmhd.patch
>   From: James Nelson <james4765@cwazy.co.uk>
>   Subject: [KJ] [PATCH 2/2][RESEND] acorn: clean up printk()'s in 	drivers/acorn/block/mfmhd.c

> --- kj/drivers/acorn/block/mfmhd.c~printk-drivers_acorn_block_mfmhd
> +++ kj-domen/drivers/acorn/block/mfmhd.c

> @@ -156,9 +159,7 @@ struct hd_geometry {
>  /*
>   * Uncomment this to enable debugging in the MFM driver...
>   */
> -#ifndef DEBUG
> -/*#define DEBUG */
> -#endif
> +
>  /*
>   * End of configuration
>   */

After this patch will be applied, there'd be nothing to uncomment.

	Alexey

--===============71770060276879444==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71770060276879444==--
