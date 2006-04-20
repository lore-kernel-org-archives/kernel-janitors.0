From: Greg KH <greg@kroah.com>
Date: Thu, 20 Apr 2006 22:27:45 +0000
Subject: Re: [KJ] Janitortask
Message-Id: <20060420222745.GA15374@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21225990195533573=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <44480174.4090601@nachtwindheim.de>
In-Reply-To: <44480174.4090601@nachtwindheim.de>
To: kernel-janitors@vger.kernel.org

--===============21225990195533573==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 20, 2006 at 11:47:32PM +0200, Henne wrote:
> Hi there,
> 
> if somebody is interested in a janitortask, here is one:
> 
> Like in <kerneldoc>/pci.txt mentioned, the "struct pci_device_id" in 
> drivers should be __devinitdata , to save place.

Well, for almost all systems, this will not really save any memory.  You
have to disable CONFIG_HOTPLUG for this to be true, and that option is
hard to turn off now.

And you have to build the driver into the kernel.

In all, it's a very minor thing.  But hey, I will not refuse patches...

thanks,

greg k-h

--===============21225990195533573==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21225990195533573==--
