From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 11 Jan 2021 15:53:20 +0000
Subject: Re: [PATCH -next] fpga: dfl-pci: rectify ReST formatting
Message-Id: <X/x0cJ2N0/VA81FK@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111112113.27242-1-lukas.bulwahn@gmail.com>
 <d22ccfa1-19a1-d48c-d822-76ea289965ab@redhat.com>
In-Reply-To: <d22ccfa1-19a1-d48c-d822-76ea289965ab@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Rix <trix@redhat.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Wu Hao <hao.wu@intel.com>, Moritz Fischer <mdf@kernel.org>, Matthew Gerlach <matthew.gerlach@linux.intel.com>, linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 11, 2021 at 07:11:59AM -0800, Tom Rix wrote:
> 
> On 1/11/21 3:21 AM, Lukas Bulwahn wrote:
> > Commit fa41d10589be ("fpga: dfl-pci: locate DFLs by PCIe vendor specific
> > capability") provides documentation to the FPGA Device Feature List (DFL)
> > Framework Overview, but introduced new documentation warnings:
> >
> >   ./Documentation/fpga/dfl.rst:
> >     505: WARNING: Title underline too short.
> >     523: WARNING: Unexpected indentation.
> >     523: WARNING: Blank line required after table.
> >     524: WARNING: Block quote ends without a blank line; unexpected unindent.
> >
> > Rectify ReST formatting in ./Documentation/fpga/dfl.rst.
> 
> Can you explain how to reproduce this problem ?

'make htmldocs'
