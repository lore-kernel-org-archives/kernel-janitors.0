From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Thu, 17 Mar 2005 15:49:04 +0000
Subject: Re: [KJ] [PATCH] printk : drivers/isdn/hardware/eicon/divasmain.c
Message-Id: <200503171847.33112.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============210948417252248=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050317150929.GQ2102@rhum.iomeda.fr>
In-Reply-To: <20050317150929.GQ2102@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============210948417252248==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Thursday 17 March 2005 17:09, Christophe Lucas wrote:

> printk() calls should include appropriate KERN_* constant.

> --- linux-2.6.11-vanilla/drivers/isdn/hardware/eicon/divasmain.c
> +++ linux-2.6.11/drivers/isdn/hardware/eicon/divasmain.c

>  	printk(KERN_INFO "%s: Rel:%s  Rev:", DRIVERLNAME, DRIVERRELEASE_DIVAS);
					^^^^
Notice there is no "\n" here. So, you're adding KERN_INFO in the middle of
the string.

>  	strcpy(tmprev, main_revision);
> -	printk("%s  Build: %s(%s)\n", getrev(tmprev),
> +	printk(KERN_INFO "%s  Build: %s(%s)\n", getrev(tmprev),
>  	       diva_xdi_common_code_build, DIVA_BUILD);

	Alexey

--===============210948417252248==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============210948417252248==--
