From: Domen Puncer <domen@coderock.org>
Date: Wed, 19 Jan 2005 10:53:22 +0000
Subject: Re: [KJ] [PATCH] drivers/ide/pci/cs5520.c fix return code value
Message-Id: <20050119105321.GI19162@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45426055378311148=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106126053.13875.59.camel@localhost.localdomain>
In-Reply-To: <1106126053.13875.59.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============45426055378311148==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19/01/05 14:44 +0530, Amit Gud wrote:
> Description: The patch follows from the suggestions by AC and Felipe W
> Damasio for fixing the return codes from IDE drivers.
> 
> Do consider applying.
> 
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> --- vanilla-2.6.10/drivers/ide/pci/cs5520.c     2005-01-19
> 11:19:28.000000000 +0530

Line wrap. (Turn this off in your mailer)

> +++ linux-2.6.9/drivers/ide/pci/cs5520.c        2005-01-19
> 14:23:50.000000000 +0530
> @@ -224,7 +224,7 @@
>         if(pci_enable_device_bars(dev, 1<<2))
	
Whitespace damage.
(Don't copy/paste. Try mailing patch to yourself first, and see if it
 applies)

>         {
>                 printk(KERN_WARNING "%s: Unable to enable 55x0.\n",
> d->name);
> -               return 1;
> +               return -EAGAIN;

-EAGAIN? -ENODEV, like it's a few lines below looks more apropriate.


>         }
>         pci_set_master(dev);
>         if (pci_set_dma_mask(dev, 0xFFFFFFFF)) {
> 
> 

Wrt. generic.c patch... is seems already merged.


	Domen

--===============45426055378311148==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45426055378311148==--
