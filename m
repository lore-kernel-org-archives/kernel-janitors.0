From: Greg KH <greg@kroah.com>
Date: Thu, 30 Sep 2004 17:11:31 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 fore200e.c] convert
Message-Id: <20040930171131.GA16316@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============074513935385178698=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <415BD20C.6050709@nuerscht.ch>
In-Reply-To: <415BD20C.6050709@nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============074513935385178698==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2004 at 11:29:48AM +0200, Tobias Klauser wrote:
> I'm sending this only to kernel-janitor since I'm not sure, if I do this 
> right (It's my first patch). It compiled without problems here.
> 
> Description: Use pci_get_device instead of pci_find_device.
> 
> Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>
> 
> diff -Nrup linux-2.6.9-rc2-mm4-vanilla/drivers/atm/fore200e.c 
> linux-2.6.9-rc2-mm4/drivers/atm/fore200e.c
> --- linux-2.6.9-rc2-mm4-vanilla/drivers/atm/fore200e.c  2004-09-30 
> 10:24:43.000000000 +0200

Becides the other errors mentioned in the patch, it is also linewrapped
and can't be applied :(

thanks,

greg k-h

--===============074513935385178698==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============074513935385178698==--
