From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 03 Oct 2004 17:34:39 +0000
Subject: Re: [Kernel-janitors] [PATCH 4/6] janitor: net/sis900:
Message-Id: <1096824878.3818.5.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54430919399752531=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1096784391.3819.161.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1096784391.3819.161.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============54430919399752531==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2004-10-03 at 01:30, Christoph Hellwig wrote:
> On Sat, Oct 02, 2004 at 11:19:51PM -0700, Scott Feldman wrote:
> > Replace pci_find_device with pci_get_device/pci_dev_put to plug
> > race with pci_find_device.  Compile tested.
> 
> Should probably also use pci_dev_present

No, because the dev pointer is needed later in the code if dev was
found.  pci_dev_present doesn't return the dev.

-scott


--===============54430919399752531==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54430919399752531==--
