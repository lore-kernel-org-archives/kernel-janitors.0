From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 19:09:57 +0000
Subject: Re: [KJ] [PATCH] drivers/net/* : pci_request_regions
Message-Id: <20050214190956.GA9697@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86495682593184053=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050214150815.GJ20620@rhum.iomeda.fr>
In-Reply-To: <20050214150815.GJ20620@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============86495682593184053==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 04:08:15PM +0100, Christophe Lucas wrote:
> Hi,
> 
> description:
> If PCI request regions fails, then someone else is using the
> hardware we wish to use. For that one case, calling
> pci_disable_device() is rather rude.
> See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html
> 
> Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

And do these drivers work on devices that have problems like was
mentioned above (they live in dumb multi-function pci devices.)?

thanks,

greg k-h

--===============86495682593184053==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86495682593184053==--
