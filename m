From: Greg KH <greg@kroah.com>
Date: Mon, 24 Apr 2006 15:57:10 +0000
Subject: Re: [KJ] [PATCH] Marking the pci_device_id tables of the
Message-Id: <20060424155710.GB6056@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75399062213335677=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <444CEB94.4010109@nachtwindheim.de>
In-Reply-To: <444CEB94.4010109@nachtwindheim.de>
To: kernel-janitors@vger.kernel.org

--===============75399062213335677==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2006 at 05:36:21PM +0200, Henne wrote:
> From: Henrik Kretzschmar <henne@nachtwindheim.de>
> 
> Marking the pci_device_id tables of the pci-subsystem as __devinitdata.
> Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
> ---
> Maybe this patch is bogus, since these drivers can't be compiled without
> HOTPLUG_PCI with Kconfig. Decide yourself. :)

It is bogus.  I will not apply it, sorry.

thanks,

greg k-h

--===============75399062213335677==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75399062213335677==--
