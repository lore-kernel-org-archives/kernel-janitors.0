From: max attems <janitor@sternwelten.at>
Date: Mon, 23 Aug 2004 20:25:07 +0000
Subject: [Kernel-janitors] Re: Replacement for pci_for_each_dev()?
Message-Id: <20040823202507.GE1805@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52733955617730377=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52733955617730377==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hello greg,

On Mon, 23 Aug 2004, Greg KH wrote:

> On Mon, Aug 23, 2004 at 10:04:23AM -0500, Timur Tabi wrote:
> > Greg KH wrote:
> > 
> > >>pci_for_each_dev()              Superseded by pci_find_device()
> > >
> > >No!  Use pci_get_device(), pci_find_device() is about to be deleted.
> > 
> > Looking at pci.txt, it appears that if I use pci_get_device(), I will 
> > also need to use pci_dev_put().
> 
> That is correct.

~/src/linux-2.6.8$ egrep -r 'pci_find_device' drivers/ | wc -l
195

i saw this in your weblog, 
could we add this item to the kernel janitor todo list?
have you any further info or pointer to help any takers?
like a patch you already submitted?

adding kj on cc, thanks


--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============52733955617730377==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52733955617730377==--
