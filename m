From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 24 Oct 2004 18:46:50 +0000
Subject: Re: [KJ] [PATCH 2.6] cyclades.c: replace pci_find_device
Message-Id: <1098643610.4188.6.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9771316986715054=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <267570000.1098383749@w-hlinder.beaverton.ibm.com>
In-Reply-To: <267570000.1098383749@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, Marcelo Tosatti <marcelo.tosatti@cyclades.com>

--===============9771316986715054==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2004-10-21 at 11:35, Hanna Linder wrote:
> diff -Nrup linux-2.6.9cln/drivers/char/cyclades.c linux-2.6.9patch/drivers/char/cyclades.c
> --- linux-2.6.9cln/drivers/char/cyclades.c	2004-10-18 16:35:53.000000000 -0700
> +++ linux-2.6.9patch/drivers/char/cyclades.c	2004-10-20 15:31:49.803025392 -0700
> @@ -4765,7 +4765,7 @@ cy_detect_pci(void)
>          for (i = 0; i < NR_CARDS; i++) {
>                  /* look for a Cyclades card by vendor and device id */
>                  while((device_id = cy_pci_dev_id[dev_index]) != 0) {
> -                        if((pdev = pci_find_device(PCI_VENDOR_ID_CYCLADES,
> +                        if((pdev = pci_get_device(PCI_VENDOR_ID_CYCLADES,
>                                          device_id, pdev)) == NULL) {
>                                  dev_index++;    /* try next device id */
>                          } else {

If there are NR_CARDS (or more) in the system, this will leave a pdev on
the table.  A pci_dev_put after the for-loop should catch it.

-scott


--===============9771316986715054==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9771316986715054==--
