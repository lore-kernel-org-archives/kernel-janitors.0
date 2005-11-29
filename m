From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 29 Nov 2005 22:21:51 +0000
Subject: Re: [KJ] [PATCH] arch/i386/crypto/aes.c: removing unused local
Message-Id: <20051129222151.GB7696@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86721762183605522=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <438C70A5.6070403@comhem.se>
In-Reply-To: <438C70A5.6070403@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============86721762183605522==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 29, 2005 at 04:15:49PM +0100, Daniel Marjam?ki wrote:

> Content-Type: text/plain; charset=ISO-8859-1; format=flowed

It must be format=flawed. Seriusly, who doubles spaces on context
lines? I see [space][space]u32 ft_tab ... again

Please, send a patch to yourself, than try to apply it.

>  u32 ft_tab[4][256];
>  u32 fl_tab[4][256];
> -static u32 ls_tab[4][256];
>  static u32 im_tab[4][256];
>  u32 il_tab[4][256];
>  u32 it_tab[4][256];
> @@ -144,15 +143,6 @@ static void gen_tabs(void)
>  		fl_tab[2][i] = upr(w, 2);
>  		fl_tab[3][i] = upr(w, 3);
>  		
> -		/*
> -		 * table for key schedule if fl_tab above is
> -		 * not of the required form
> -		 */
> -		ls_tab[0][i] = w;
> -		ls_tab[1][i] = upr(w, 1);
> -		ls_tab[2][i] = upr(w, 2);
> -		ls_tab[3][i] = upr(w, 3);
> -		
>  		b = fi(inv_affine((u8)i));
>  		w = bytes2word(fe(b), f9(b), fd(b), fb(b));
> 
> 
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============86721762183605522==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86721762183605522==--
