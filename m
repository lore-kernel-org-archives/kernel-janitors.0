From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 03 Oct 2004 17:33:29 +0000
Subject: Re: [Kernel-janitors] [PATCH 2/6] janitor: net/gt96100eth:
Message-Id: <1096824809.3818.2.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5762458740821701=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1096784371.3819.157.camel@sfeldma-mobl2.dsl-verizon.net>
	 <20041003092942.A28174@infradead.org>
In-Reply-To: <20041003092942.A28174@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: kernel-janitors@lists.osdl.org, stevel@mvista.com, source@mvista.com, linux-mips@linux-mips.org

--===============5762458740821701==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2004-10-03 at 01:29, Christoph Hellwig wrote:
> On Sat, Oct 02, 2004 at 11:19:31PM -0700, Scott Feldman wrote:
> > Replace pci_find_device with pci_get_device/pci_dev_put to plug
> > race with pci_find_device.
> 
> Shouldn't this use pci_dev_present?

No, because the dev pointer is needed later in the code if dev was
found.  pci_dev_present doesn't return the dev.

-scott


--===============5762458740821701==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5762458740821701==--
