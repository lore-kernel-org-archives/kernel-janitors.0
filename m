From: Alex Williamson <alex.williamson@redhat.com>
Date: Tue, 10 Nov 2015 19:03:52 +0000
Subject: Re: [patch v2] vfio/pci: make an array larger
Message-Id: <1447182232.4925.116.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151109122455.GA28870@mwanda>
In-Reply-To: <20151109122455.GA28870@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Sean O. Stalley" <sean.stalley@intel.com>, Mark Rustad <mark.d.rustad@intel.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2015-11-09 at 15:24 +0300, Dan Carpenter wrote:
> Smatch complains about a possible out of bounds error:
> 
> 	drivers/vfio/pci/vfio_pci_config.c:1241 vfio_cap_init()
> 	error: buffer overflow 'pci_cap_length' 20 <= 20
> 
> The problem is that pci_cap_length[] was defined as large enough to
> hold "PCI_CAP_ID_AF + 1" elements.  The code in vfio_cap_init() assumes
> it has PCI_CAP_ID_MAX + 1 elements.  Originally, PCI_CAP_ID_AF and
> PCI_CAP_ID_MAX were the same but then we introduced PCI_CAP_ID_EA in
> f80b0ba95964 ('PCI: Add Enhanced Allocation register entries') so now
> the array is too small.
> 
> Let's fix this by making the array size PCI_CAP_ID_MAX + 1.  And let's
> make a similar change to pci_ext_cap_length[] for consistency.  Also
> both these arrays can be made const.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to next for v4.4.  Thanks!

Alex

