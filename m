From: Scott Feldman <sfeldma@pobox.com>
Date: Mon, 04 Oct 2004 03:43:08 +0000
Subject: Re: [Kernel-janitors] Status of pci_find_device fixes
Message-Id: <1096861388.3819.6.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88444737689688901=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <415AB420.9050406@nuerscht.ch>
In-Reply-To: <415AB420.9050406@nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============88444737689688901==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-09-29 at 11:15, Hanna Linder wrote:

> Thanks for your interest. There are a couple of us working in this area already but if we all
> coordinate it should help get the work done quickly. Scott is doing everything under drivers/net
> to start with. Greg and I finished everything under arch/i386. Right now I am working on
> all the drivers that can be converted to the new pci_dev_present function. That leaves over
> 100 drivers that need to be converted (cscope and grep are your friend).

driver/net is shaping up.  There are still a couple that need
probe/remove conversion.

I'm heading over to drivers/scsi next, FWIW.

-scott


--===============88444737689688901==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88444737689688901==--
