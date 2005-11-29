From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 29 Nov 2005 12:58:59 +0000
Subject: Re: [KJ] changed from pci_find_device to pci_get_device
Message-Id: <20051129125859.GB2573@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37883460734512986=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <438A0BE0.4010904@comhem.se>
In-Reply-To: <438A0BE0.4010904@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============37883460734512986==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 29, 2005 at 12:51:27PM +0100, Daniel Marjam?ki wrote:
> About the chunk you didn't understand.
> The function must return an unsigned int, therefore "return -ENODEV;" is
> wrong.

->init_chipset method returns either small positive number (irq) or BIG
positive number in case of error ((unsigned int) -ENODEV). In
do_ide_setup_pci_device() function ->init_chipset return value is casted to int
and checked for "< 0".

> >>--- a/drivers/ide/pci/via82cxxx.c
> >>+++ b/drivers/ide/pci/via82cxxx.c
> >>@@ -282,7 +285,7 @@ static unsigned int __devinit init_chips
> >>	via_config = via_config_find(&isa);
> >>	if (!via_config->id) {
> >>		printk(KERN_WARNING "VP_IDE: Unknown VIA SouthBridge,
> >>		disabling DMA.\n");
> >>-		return -ENODEV;
> >>+		return ENODEV;
> >>	}
> >
> >
> >I do not understand this chunk.


--===============37883460734512986==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37883460734512986==--
