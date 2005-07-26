From: Domen Puncer <domen@coderock.org>
Date: Tue, 26 Jul 2005 08:39:27 +0000
Subject: Re: [KJ] forwarded errors
Message-Id: <20050726083927.GC2252@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2393379006377514=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <958d5cd10507260030459e2890@mail.gmail.com>
In-Reply-To: <958d5cd10507260030459e2890@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============2393379006377514==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 26/07/05 09:30 +0200, Lo?c Martin wrote:
> kernel: 2.6.11.10
> 
> Hello
> 
> Currently writting down a pci driver, I notice that
> "pci_register_driver(&pci_driver)" don't forward my "probe" function
> errors.

Because you could have 0 devices at that time. And devices could be
added to system after pci_register_driver is called (think hotplug).

driver != device

> Actually errors are noticed in the kernel ring buffer but don't make
> pci_register_driver  fail. It returns a zero value in any case.
> I traced back to the kernel in order to try to understand this problem
> and find the "void driver_attach(struct device_driver * drv)" function
> in the "linux-2.6.11.10/drivers/base/bus.c" file which, obviously, can
> not returns an error.
> 
> So I just wish to know why this function only print this message :
> 
>                                /* driver matched but the probe failed */
>                                printk(KERN_WARNING
>                                    "%s: probe of %s failed with error %d\n",
>                                    drv->name, dev->bus_id, error);
> 
> but don't return the error.
> Actually I don't understand why the module is loaded (because
> pci_register_driver, which is called during __init, don't fail) while
> my pci card could not have been initialized by "probe" function
> because it failed for such reasons.
> 
> Thanks
> 
> -- 
> Lo?c 
> -------------------
> hardware, n:
>       The parts of a computer system that can be kicked.
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2393379006377514==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2393379006377514==--
