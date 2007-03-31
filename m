From: Greg KH <greg@kroah.com>
Date: Sat, 31 Mar 2007 14:32:22 +0000
Subject: Re: [KJ] my first janitorial
Message-Id: <20070331143222.GA11845@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
In-Reply-To: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Mar 31, 2007 at 06:39:01AM -0700, Pedram M wrote:
> for: drivers/char/istallion.c
> 
> 
> @@ -4590,7 +4590,7 @@
>         printk("stli_findpcibrds()\n");
>  #endif
> 
> -       while ((dev = pci_find_device(PCI_VENDOR_ID_STALLION,
> +       while ((dev = pci_get_device(PCI_VENDOR_ID_STALLION,

I think this leaks the reference count on the pci device.  Where do you
decrement it?

Please read the documentation for the pci_get_device() function, it is
not a simple search-and-replace fix for this task.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
