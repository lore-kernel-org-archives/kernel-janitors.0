From: Jeff Garzik <jgarzik@pobox.com>
Date: Thu, 17 Feb 2005 18:49:12 +0000
Subject: Re: [KJ] [PATCH] drivers/char/watchdog/* : pci_request_regions
Message-Id: <4214E728.3030501@pobox.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75698981542730648=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050214150111.GH20620@rhum.iomeda.fr> <20050214151244.GF29917@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050214151244.GF29917@parcelfarce.linux.theplanet.co.uk>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Christophe Lucas <c.lucas@ifrance.com>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============75698981542730648==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Matthew Wilcox wrote:
> On Mon, Feb 14, 2005 at 04:01:11PM +0100, Christophe Lucas wrote:
> 
>>If PCI request regions fails, then someone else is using the
>>hardware we wish to use. For that one case, calling
>>pci_disable_device() is rather rude.
>>See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html
> 
> 
> Actually, that isn't necessarily true.  If the request_regions call fails,
> that can mean there's a resource conflict.  If so, leaving the device
> enabled is the worst possible thing to do as we'll now have two devices
> trying to respond to the same io accesses.

Incorrect.  If request_region() fails, drivers are coded to _not_ touch 
the hardware.  That's the entire purpose of the whole charade: to avoid 
having two devices responding to the same io accesses.

If your driver is talking to the hardware after request_region() fails, 
it is BROKEN plain and simple.

	Jeff




--===============75698981542730648==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75698981542730648==--
