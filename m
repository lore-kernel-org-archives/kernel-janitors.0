From: "Cong WANG" <xiyou.wangcong@gmail.com>
Date: Sat, 31 Mar 2007 13:59:04 +0000
Subject: Re: [KJ] my first janitorial
Message-Id: <2375c9f90703310659ye6bd43apc02e2028a9c3284e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
In-Reply-To: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2007/3/31, Pedram M <pmessri@gmail.com>:
> for: drivers/char/istallion.c
>
>
> @@ -4590,7 +4590,7 @@
>         printk("stli_findpcibrds()\n");
>  #endif
>
> -       while ((dev = pci_find_device(PCI_VENDOR_ID_STALLION,
> +       while ((dev = pci_get_device(PCI_VENDOR_ID_STALLION,
>             PCI_DEVICE_ID_ECRA, dev))) {
>                 if ((rc = stli_initpcibrd(BRD_ECPPCI, dev)))
>                         return(rc);
>
>
> Thanks,
> Pedram

Please do read Documentation/SubmittingPatches first before you submit a patch.


-- 
So Dark The Con Of Man.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
