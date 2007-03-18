From: Greg KH <greg@kroah.com>
Date: Sun, 18 Mar 2007 17:54:57 +0000
Subject: Re: [KJ] [PATCH] changing pci api to newer
Message-Id: <20070318175457.GA9931@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <adc360f60703170547s3e610342v3a15cac1ecf922c0@mail.gmail.com>
In-Reply-To: <adc360f60703170547s3e610342v3a15cac1ecf922c0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Mar 17, 2007 at 01:47:09PM +0100, Przemek Lib wrote:
> changed pci_find_device to pci_get_device
> Signed-of-by Przemyslaw Lib an.przemek@gmail.com
> ---
> I found "delete all pci_find_* functions from the kernel tree. Instead
> of pci_find_device use pci_get_device()." on:
> http://kernelnewbies.org/KernelJanitors/Todo
> 
> and i found pci_find_device in
> drivers/isdn/hisax/diva.c
> and changed it to pci_get_devices

You can't just search and replace, you now have a reference count on the
pci device that must be handled properly.  Read the documentation for
the pci_get_device() function for more details.

So no, this, and your other patch, is incorrect and should not be
applied.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
