From: Andy Walls <awalls@md.metrocast.net>
Date: Thu, 15 Jul 2010 21:43:20 +0000
Subject: Re: [PATCH 24/25] video/ivtv: Convert pci_table entries to
Message-Id: <1279230200.7920.23.camel@morgan.silverblock.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007152108.27175.PeterHuewe@gmx.de>
In-Reply-To: <201007152108.27175.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: Kernel Janitors <kernel-janitors@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Ian Armstrong <ian@iarmst.demon.co.uk>, Douglas Schilling Landgraf <dougsland@redhat.com>, Steven Toth <stoth@kernellabs.com>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2010-07-15 at 21:08 +0200, Peter Huewe wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
> 
> This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
> .subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
> PCI_VDEVICE macro, and thus improves readability.

Hi Peter,

I have to disagree.  The patch may improve typesetting, but it degrades
clarity and maintainability from my perspective.

a. PCI_ANY_ID indicates to the reader a wildcard match is being
performed.  The PCI_VDEVICE() macro hides that to some degree.

b. PCI_VENDOR_ID_ICOMP clearly indicates that ICOMP is a vendor.
"ICOMP" alone does not hint to the reader that is stands for a company
(the now defunct "Internext Compression, Inc.").


IMO, macros, for things other than named constants, should only be used
for constructs that the C language does not express clearly or compactly
in the context.  This structure initialization being done in file scope,
where white space and line feeds are cheap, will only be obfuscated by
macros, not clarified.

So I'm going to NAK this for ivtv, unless someone can help me understand
any big picture benefit that I may not see from my possibly myopic
perspective.


BTW, I have not seen a similar patch come in my mailbox for
cx18-driver.c.  Why propose the change for ivtv and not cx18?

Regards,
Andy

> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
>  drivers/media/video/ivtv/ivtv-driver.c |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/video/ivtv/ivtv-driver.c b/drivers/media/video/ivtv/ivtv-driver.c
> index 90daa6e..8e73ab9 100644
> --- a/drivers/media/video/ivtv/ivtv-driver.c
> +++ b/drivers/media/video/ivtv/ivtv-driver.c
> @@ -69,10 +69,8 @@ int ivtv_first_minor;
>  
>  /* add your revision and whatnot here */
>  static struct pci_device_id ivtv_pci_tbl[] __devinitdata = {
> -	{PCI_VENDOR_ID_ICOMP, PCI_DEVICE_ID_IVTV15,
> -	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> -	{PCI_VENDOR_ID_ICOMP, PCI_DEVICE_ID_IVTV16,
> -	 PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> +	{PCI_VDEVICE(ICOMP, PCI_DEVICE_ID_IVTV15), 0},
> +	{PCI_VDEVICE(ICOMP, PCI_DEVICE_ID_IVTV16), 0},
>  	{0,}
>  };
>  


