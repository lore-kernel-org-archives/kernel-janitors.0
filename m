From: Greg KH <greg@kroah.com>
Date: Fri, 05 Nov 2004 23:06:27 +0000
Subject: [KJ] Re: [PATCH 2.6] cyclades.c: replace pci_find_device
Message-Id: <20041105230627.GE31080@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============022465364393269294=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <267570000.1098383749@w-hlinder.beaverton.ibm.com>
In-Reply-To: <267570000.1098383749@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, Marcelo Tosatti <marcelo.tosatti@cyclades.com>

--===============022465364393269294==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 21, 2004 at 11:35:49AM -0700, Hanna Linder wrote:
> 
> As pci_find_device is going away I've replaced it with pci_get_device.
> If someone with this hardware could test it I would appreciate it.
> 
> Thanks.
> 
> Hanna Linder
> IBM Linux Technology Center
> 
> Signed-off-by: Hanna Linder <hannal@us.ibm.com>


Applied, thanks.

greg k-h


--===============022465364393269294==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============022465364393269294==--
