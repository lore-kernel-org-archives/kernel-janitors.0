From: Greg KH <greg@kroah.com>
Date: Mon, 28 Nov 2005 20:53:34 +0000
Subject: Re: [KJ] changed from pci_find_device to pci_get_device
Message-Id: <20051128205334.GF17740@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95521373439234569=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <438A0BE0.4010904@comhem.se>
In-Reply-To: <438A0BE0.4010904@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============95521373439234569==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 27, 2005 at 08:41:20PM +0100, Daniel Marjam?ki wrote:
> 
> 
> Hello friends!
> 
> I've made some changes and are interested in feedback 
> (drivers/ide/pci/via82cxxx.c).
> 
> Some notes:
> * The main change was to switch from pci_find_device to pci_get_device.
> * I unlock "isa" when it won't be used anymore
> * Changed a return value because init_chipset_via82cxxx returns an unsigned 
> value.
> 
> This is the patch in a readable format:

But it's not in a format that could be applied :(

Also, try splitting this up into 3 different patches, as you are doing
three different things.

thanks,

greg k-h

--===============95521373439234569==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95521373439234569==--
