From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 19:10:31 +0000
Subject: Re: [KJ] [PATCH] drivers/char/watchdog/* : pci_request_regions
Message-Id: <20050214191031.GB9697@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============099902778806010062=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050214150111.GH20620@rhum.iomeda.fr>
In-Reply-To: <20050214150111.GH20620@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============099902778806010062==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 04:01:11PM +0100, Christophe Lucas wrote:
> Hi,
> 
> description:
> If PCI request regions fails, then someone else is using the
> hardware we wish to use. For that one case, calling
> pci_disable_device() is rather rude.
> See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html
> 
> Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

Do these devices live on the broken type of devices that are described
above?

thanks,

greg k-h


--===============099902778806010062==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============099902778806010062==--
