From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 30 Sep 2004 12:05:47 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 fore200e.c] convert
Message-Id: <20040930120547.GM16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55071517361475886=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <415BD20C.6050709@nuerscht.ch>
In-Reply-To: <415BD20C.6050709@nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============55071517361475886==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2004 at 11:29:48AM +0200, Tobias Klauser wrote:
> I'm sending this only to kernel-janitor since I'm not sure, if I do this 
> right (It's my first patch). It compiled without problems here.
> 
> Description: Use pci_get_device instead of pci_find_device.

You can't just replace pci_find_device() with pci_get_device().  Otherwise
it'd all be much simpler.  You must understand what the code is doing, and
figure out what needs to be done to be hotplug safe.  You need to read
Documentation/pci.txt and understand it.

> 10:24:43.000000000 +0200
> +++ linux-2.6.9-rc2-mm4/drivers/atm/fore200e.c  2004-09-30 
> 10:41:20.368794120 +0200
> @@ -644,7 +644,7 @@ fore200e_pca_detect(const struct fore200
>      int              count = index;
> 
>      do {
> -       pci_dev = pci_find_device(PCI_VENDOR_ID_FORE, 
> PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
> +       pci_dev = pci_get_device(PCI_VENDOR_ID_FORE, 
> PCI_DEVICE_ID_FORE_PCA200E, pci_dev);
>         if (pci_dev == NULL)
>             return NULL;
>      } while (count--);

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============55071517361475886==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55071517361475886==--
