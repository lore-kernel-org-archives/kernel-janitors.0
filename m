From: Gerd Knorr <kraxel@bytesex.org>
Date: Fri, 01 Oct 2004 07:41:35 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 zr36120.c][5/8] Convert
Message-Id: <20041001074135.GB31175@bytesex>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99323822838602105=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <19730000.1096496900@w-hlinder.beaverton.ibm.com> <1096496127.16721.10.camel@localhost.localdomain> <24740000.1096500358@w-hlinder.beaverton.ibm.com> <20040930082748.GC20456@bytesex> <56140000.1096583304@w-hlinder.beaverton.ibm.com>
In-Reply-To: <56140000.1096583304@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, greg@kroah.com

--===============99323822838602105==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> Thanks a lot for your help. Is this what you were thinking?

> +++ linux-2.6.9-rc2-mm4patch/drivers/media/video/zr36120.c	2004-09-30 15:17:56.201723784 -0700

> -	while ((dev = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437, dev)))
> -	{
> +	if (pci_pci_problems & PCIPCI_TRITON) {
>  		printk(KERN_INFO "zoran: Host bridge 82437FX Triton PIIX\n");
>  		triton1 = ZORAN_VDC_TRICOM;

Looks fine to me.

  Gerd

-- 
return -ENOSIG;

--===============99323822838602105==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99323822838602105==--
