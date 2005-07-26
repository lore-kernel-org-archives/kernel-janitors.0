From: =?ISO-8859-1?Q?Lo=EFc_Martin?= <martinloik@gmail.com>
Date: Tue, 26 Jul 2005 07:30:45 +0000
Subject: [KJ] forwarded errors
Message-Id: <958d5cd10507260030459e2890@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

kernel: 2.6.11.10

Hello

Currently writting down a pci driver, I notice that
"pci_register_driver(&pci_driver)" don't forward my "probe" function
errors.
Actually errors are noticed in the kernel ring buffer but don't make
pci_register_driver  fail. It returns a zero value in any case.
I traced back to the kernel in order to try to understand this problem
and find the "void driver_attach(struct device_driver * drv)" function
in the "linux-2.6.11.10/drivers/base/bus.c" file which, obviously, can
not returns an error.

So I just wish to know why this function only print this message :

                               /* driver matched but the probe failed */
                               printk(KERN_WARNING
                                   "%s: probe of %s failed with error %d\n",
                                   drv->name, dev->bus_id, error);

but don't return the error.
Actually I don't understand why the module is loaded (because
pci_register_driver, which is called during __init, don't fail) while
my pci card could not have been initialized by "probe" function
because it failed for such reasons.

Thanks

--=20
Lo=EFc=20
-------------------
hardware, n:
      The parts of a computer system that can be kicked.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
