From: Christoph Hellwig <hch@infradead.org>
Date: Sun, 03 Oct 2004 08:30:30 +0000
Subject: Re: [Kernel-janitors] [PATCH 4/6] janitor: net/sis900:
Message-Id: <20041003093030.B28174@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39414204492289273=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1096784391.3819.161.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1096784391.3819.161.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============39414204492289273==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 02, 2004 at 11:19:51PM -0700, Scott Feldman wrote:
> Replace pci_find_device with pci_get_device/pci_dev_put to plug
> race with pci_find_device.  Compile tested.

Should probably also use pci_dev_present


--===============39414204492289273==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39414204492289273==--
