From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 21:57:25 +0000
Subject: Re: [KJ][Patch] remove second masking instance of variable in
Message-Id: <20060220215725.GG29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90092423895614804=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139492214.17930.41.camel@localhost.localdomain>
In-Reply-To: <1139492214.17930.41.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============90092423895614804==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 10, 2006 at 11:37:39PM +1100, Darren Jenkins" wrote:
> Remark #1599: Declaration hides variable "variable name"
> 
> static int acpi_pci_root_add(struct acpi_device *device)
> 
> declares status twice:
> 
> 159: "acpi_status status = AE_OK;"
> and
> 232: "acpi_status status;"

> --- linux-2.6.16-rc2/drivers/acpi/pci_root.c.orig
> +++ linux-2.6.16-rc2/drivers/acpi/pci_root.c
> @@ -229,7 +229,6 @@ static int acpi_pci_root_add(struct acpi
>  		if ((tmp->id.segment == root->id.segment)
>  		    && (tmp->id.bus == root->id.bus)) {
>  			int bus = 0;
> -			acpi_status status;

Applied. You're lucky that noone needs outer "status" value after this
loop.


--===============90092423895614804==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90092423895614804==--
