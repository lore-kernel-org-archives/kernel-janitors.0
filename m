From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 15:53:49 +0000
Subject: Re: [Kernel-janitors] [PATCH -mm 1/9] pci_find_device to
Message-Id: <1095782029.3790.115.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36015564797083899=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095749544.3790.83.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095749544.3790.83.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============36015564797083899==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2004-09-21 at 00:38, Christoph Hellwig wrote:
> On Mon, Sep 20, 2004 at 11:52:24PM -0700, Scott Feldman wrote:
> > Use pci_get_device instead of pci_find_device as pci device returned
> > from pci_find_device can disappear at any momemt in time.
> 
> Again, this is totally the wrong change.  You should be using the proper
> interface (->shutdown callback) instead.

Wouldn't this be a good item to add to the KJ TODO list, since there are
probably other examples of this wrongness outside the scope of changing
pci_find_device to pci_get_device?  This way, we can get all of the
pci_find_device, and then all of the wrong shutdown notifiers.

-scott


--===============36015564797083899==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36015564797083899==--
