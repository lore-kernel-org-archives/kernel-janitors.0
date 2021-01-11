From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 11 Jan 2021 17:10:01 +0000
Subject: Re: [PATCH -next] fpga: dfl-pci: rectify ReST formatting
Message-Id: <CAKXUXMwTRC+NBZ=KDfZCMwjSxt+B_gg7F74apxCE=wp7C3d-Ag@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111112113.27242-1-lukas.bulwahn@gmail.com> <X/x07V2WqhmkIMcr@archbook>
In-Reply-To: <X/x07V2WqhmkIMcr@archbook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Moritz Fischer <mdf@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wu Hao <hao.wu@intel.com>, Matthew Gerlach <matthew.gerlach@linux.intel.com>, linux-fpga@vger.kernel.org, Tom Rix <trix@redhat.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Jan 11, 2021 at 4:55 PM Moritz Fischer <mdf@kernel.org> wrote:
>
> Hi Lukas,
>
> On Mon, Jan 11, 2021 at 12:21:13PM +0100, Lukas Bulwahn wrote:
> > Commit fa41d10589be ("fpga: dfl-pci: locate DFLs by PCIe vendor specific
> > capability") provides documentation to the FPGA Device Feature List (DFL)
> Nit: Do you want to make this a Fixes: tag instead?

IMHO, it is just adjusting the mark-up of the documentation and that
does not deserve a Fixes: tag.

Also, in the past, I got more frequent rejections when adding Fixes:
tags for such patches compared to proposals adding a Fixes: tag. So, I
settled for not adding Fixes: tags for such minor adjustment patches.

Lukas

> > Framework Overview, but introduced new documentation warnings:
> >
> >   ./Documentation/fpga/dfl.rst:
> >     505: WARNING: Title underline too short.
> >     523: WARNING: Unexpected indentation.
> >     523: WARNING: Blank line required after table.
> >     524: WARNING: Block quote ends without a blank line; unexpected unindent.
> >
> > Rectify ReST formatting in ./Documentation/fpga/dfl.rst.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Acked-by: Moritz Fischer <mdf@kernel.org>
> > ---
> > applies cleanly on next-20210111
> >
> > Moritz, Matthew, please ack.
> >
> > Greg, please pick this doc fixup to your fpga -next tree on top of
> > the commit above.
> >
> >  Documentation/fpga/dfl.rst | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
> > index ea8cefc18bdb..c41ac76ffaae 100644
> > --- a/Documentation/fpga/dfl.rst
> > +++ b/Documentation/fpga/dfl.rst
> > @@ -502,7 +502,7 @@ FME Partial Reconfiguration Sub Feature driver (see drivers/fpga/dfl-fme-pr.c)
> >  could be a reference.
> >
> >  Location of DFLs on a PCI Device
> > -=============> > +================
> >  The original method for finding a DFL on a PCI device assumed the start of the
> >  first DFL to offset 0 of bar 0.  If the first node of the DFL is an FME,
> >  then further DFLs in the port(s) are specified in FME header registers.
> > @@ -514,6 +514,7 @@ data begins with a 4 byte vendor specific register for the number of DFLs follow
> >  Offset/BIR vendor specific registers for each DFL. Bits 2:0 of Offset/BIR register
> >  indicates the BAR, and bits 31:3 form the 8 byte aligned offset where bits 2:0 are
> >  zero.
> > +::
> >
> >          +----------------------------+
> >          |31     Number of DFLS      0|
> > --
> > 2.17.1
> >
>
> Thanks for doing this, I was about to send that same patch myself.
>
> - Moritz
