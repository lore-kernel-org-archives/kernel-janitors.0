From: "Arnaldo Carvalho de Melo" <acme@ghostprotocols.net>
Date: Sat, 31 Mar 2007 13:55:49 +0000
Subject: Re: [KJ] my first janitorial
Message-Id: <39e6f6c70703310655u5c006359rbecef60a72656c01@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
In-Reply-To: <9c9aa5d00703310639q68fa5d19k4d8e3bfb56b1fa6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 3/31/07, Pedram M <pmessri@gmail.com> wrote:
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

Congratulations for your first patch! But please add a changeset
comment stating the reason for the patch, followed by your
Signed-off-by: line, all the details are available at the
Documentation/SubmittingPatches file in the kernel sources.

Regards,

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
