From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sat, 17 Mar 2007 16:33:52 +0000
Subject: Re: [KJ] [PATCH] changing pci api to newer
Message-Id: <45FC1870.2050507@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <adc360f60703170547s3e610342v3a15cac1ecf922c0@mail.gmail.com>
In-Reply-To: <adc360f60703170547s3e610342v3a15cac1ecf922c0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Przemek Lib wrote:
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
>
>   
As Kernel Janitors Todo also says:
"NOTE: Search & Replace

Sometimes all your patch will do is simply changing one function to 
another. Doing this is especially tempting in "convert to new API" 
section. History shows this is often wrong: old bugs are not fixed, new 
bugs are introduced.

I got curious since I also would like to see the old API go away, but 
only know of pci_module_init whom can be directly converted to 
pci_register_driver since it is just a #define nowadays. So I checked 
out drivers/pci/search.c (contains pci_find_device() and 
pci_get_device(), what differed were that pci_get_device() increment the 
reference count for *from. From what I can see (Documentation/pci.txt), 
this is done to make it hotplug-safe (line 248). So you should also fix 
it when it is unloaded (guess it is another new API-function).

cu
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
