From: Moritz Fischer <mdf@kernel.org>
Date: Thu, 14 Jan 2021 16:45:15 +0000
Subject: Re: [PATCH -next] fpga: dfl-pci: rectify ReST formatting
Message-Id: <YAB1G9e4lCaKq0sq@epycbox.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111112113.27242-1-lukas.bulwahn@gmail.com>
 <X/x0j+hWRdJ6U/MG@kroah.com>
 <CAKXUXMzR2J895_+ZsRqcJ___Pu0HnRfiiFFrGfehQe8J4kQrgg@mail.gmail.com>
 <X/yVflU6ccIlAtgO@kroah.com>
In-Reply-To: <X/yVflU6ccIlAtgO@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Wu Hao <hao.wu@intel.com>, Moritz Fischer <mdf@kernel.org>, Matthew Gerlach <matthew.gerlach@linux.intel.com>, linux-fpga@vger.kernel.org, Tom Rix <trix@redhat.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Greg,

On Mon, Jan 11, 2021 at 07:14:22PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 11, 2021 at 05:34:57PM +0100, Lukas Bulwahn wrote:
> > On Mon, Jan 11, 2021 at 4:52 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Jan 11, 2021 at 12:21:13PM +0100, Lukas Bulwahn wrote:
> > > > Commit fa41d10589be ("fpga: dfl-pci: locate DFLs by PCIe vendor specific
> > > > capability") provides documentation to the FPGA Device Feature List (DFL)
> > > > Framework Overview, but introduced new documentation warnings:
> > > >
> > > >   ./Documentation/fpga/dfl.rst:
> > > >     505: WARNING: Title underline too short.
> > > >     523: WARNING: Unexpected indentation.
> > > >     523: WARNING: Blank line required after table.
> > > >     524: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > >
> > > > Rectify ReST formatting in ./Documentation/fpga/dfl.rst.
> > > >
> > > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > >
> > 
> > > You forgot a Reported-by: tag for the person who notified you of this :(
> > 
> > Greg, would you believe that I run 'make htmldocs' on linux-next myself?
> 
> Sure, just seemed to match up with when Stephen reported this a few
> hours earlier...
> 
> thanks,
> 
> greg k-h

Are you waiting for a resend on this? Just asking because we got three
versions of this patch by now :)

I haven't re-sent this since you were already on the thread.

- Moritz
