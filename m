From: Christoph Hellwig <hch@infradead.org>
Date: Sun, 03 Oct 2004 08:29:42 +0000
Subject: Re: [Kernel-janitors] [PATCH 2/6] janitor: net/gt96100eth:
Message-Id: <20041003092942.A28174@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============021119864365645835=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1096784371.3819.157.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1096784371.3819.157.camel@sfeldma-mobl2.dsl-verizon.net>; from sfeldma@pobox.com on Sat, Oct 02, 2004 at 11:19:31PM -0700
To: Scott Feldman <sfeldma@pobox.com>
Cc: kernel-janitors@lists.osdl.org, stevel@mvista.com, source@mvista.com, linux-mips@linux-mips.org

--===============021119864365645835==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 02, 2004 at 11:19:31PM -0700, Scott Feldman wrote:
> Replace pci_find_device with pci_get_device/pci_dev_put to plug
> race with pci_find_device.

Shouldn't this use pci_dev_present?


--===============021119864365645835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============021119864365645835==--
