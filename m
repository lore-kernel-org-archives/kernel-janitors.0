From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 10 Aug 2005 10:55:38 +0000
Subject: Re: [KJ] [PATCH] removing odd number of parentheses
Message-Id: <20050810110128.GC12864@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24566635816857851=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050809140939.GA4603@voyager>
In-Reply-To: <20050809140939.GA4603@voyager>
To: kernel-janitors@vger.kernel.org

--===============24566635816857851==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 09, 2005 at 04:09:40PM +0200, Carlo Perassi wrote:
> --- linux-2.6.13-rc6/arch/ppc/syslib/qspan_pci.c
> +++ linux-2.6.13-rc6-mod/arch/ppc/syslib/qspan_pci.c

>  void __init
> -m8xx_pcibios_fixup(void))
> +m8xx_pcibios_fixup(void)

I wasn't patient fighting with Gmail SMTP server. This line exists since
2.4.0 ;-).


--===============24566635816857851==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24566635816857851==--
