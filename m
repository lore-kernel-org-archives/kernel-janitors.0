From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 19 Nov 2005 02:17:04 +0000
Subject: Re: [KJ] [PATCH] sound/oss/maestro3.c printk args concatenation
Message-Id: <29495f1d0511181817j562eb664i6bfb1d8165f0063c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <437E8107.2000103@nhw.pl>
In-Reply-To: <437E8107.2000103@nhw.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/18/05, Witold Rugowski <rugowski@nhw.pl> wrote:
> Removed string concatenation in printk args
>
> Signed-off-by: Witold Rugowski <rugowski@nhw.pl>
>
> diff -urpN  linux-2.6.14.2/sound/oss/maestro3.c linux-2.6.14.2-wr/sound/oss/maestro3.c
> --- linux-2.6.14.2/sound/oss/maestro3.c Fri Nov 11 06:33:12 2005
> +++ linux-2.6.14.2-wr/sound/oss/maestro3.c      Fri Nov 18 23:56:37 2005
> @@ -2935,7 +2935,7 @@ static struct pci_driver m3_pci_driver >
>  static int __init m3_init_module(void)
>  {
> -    printk(KERN_INFO PFX "version " DRIVER_VERSION " built at " __TIME__ "
> "__DATE__ "\n");
> +    printk(KERN_INFO "%sversion %s built at %s
> %s\n",PFX,DRIVER_VERSION,__TIME__, __DATE__);

Missing spaces?

printk(KERN_INFO "%s version %s built at %s %s\n", PFX,
DRIVER_VERSION, __TIME__, __DATE__);

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
