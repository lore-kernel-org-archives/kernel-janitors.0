From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 08 Jan 2006 21:15:52 +0000
Subject: Re: [KJ] [Patch] Check unsigned < 0 in /drivers/net/acenic.c
Message-Id: <20060108211552.GA7488@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44397586451182569=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134691549.14588.3.camel@alice>
In-Reply-To: <1134691549.14588.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============44397586451182569==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> since read_eeprom_byte() returns a negative value on an error
> condition, tmp should be signed so the comparisons in line 1007
> and 1017 can catch the error.

> --- linux-2.6.15-rc5-git5/drivers/net/acenic.c.orig
> +++ linux-2.6.15-rc5-git5/drivers/net/acenic.c
> @@ -905,7 +905,8 @@ static int __devinit ace_init(struct net
>  	struct pci_dev *pdev;
>  	unsigned long myjif;
>  	u64 tmp_ptr;
> -	u32 tig_ver, mac1, mac2, tmp, pci_state;
> +	u32 tig_ver, mac1, mac2, pci_state;
> +	int tmp;
>  	int board_idx, ecode = 0;
>  	short i;
>  	unsigned char cache_size;

Looks like there are two different tmps: one for read_eeprom_byte,
another for writing to PCI state.


--===============44397586451182569==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44397586451182569==--
