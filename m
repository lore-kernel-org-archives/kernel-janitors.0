From: Greg KH <greg@kroah.com>
Date: Mon, 23 Aug 2004 22:12:51 +0000
Subject: [Kernel-janitors] Re: Replacement for pci_for_each_dev()?
Message-Id: <20040823221251.GC4694@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94749565461562169=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040823202507.GE1805@stro.at>
In-Reply-To: <20040823202507.GE1805@stro.at>
To: kernel-janitors@vger.kernel.org

--===============94749565461562169==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 23, 2004 at 10:25:07PM +0200, max attems wrote:
> 
> ~/src/linux-2.6.8$ egrep -r 'pci_find_device' drivers/ | wc -l
> 195
> 
> i saw this in your weblog, 
> could we add this item to the kernel janitor todo list?

Sure.

> have you any further info or pointer to help any takers?
> like a patch you already submitted?

I did a bunch of cleanups like it a long time ago (during 2.5), but I
don't have a pointer at this moment, sorry.

tanks,

greg k-h

--===============94749565461562169==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94749565461562169==--
