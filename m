From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 11 Jan 2021 15:53:51 +0000
Subject: Re: [PATCH -next] fpga: dfl-pci: rectify ReST formatting
Message-Id: <X/x0j+hWRdJ6U/MG@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111112113.27242-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210111112113.27242-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Wu Hao <hao.wu@intel.com>, Moritz Fischer <mdf@kernel.org>, Matthew Gerlach <matthew.gerlach@linux.intel.com>, linux-fpga@vger.kernel.org, Tom Rix <trix@redhat.com>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 11, 2021 at 12:21:13PM +0100, Lukas Bulwahn wrote:
> Commit fa41d10589be ("fpga: dfl-pci: locate DFLs by PCIe vendor specific
> capability") provides documentation to the FPGA Device Feature List (DFL)
> Framework Overview, but introduced new documentation warnings:
> 
>   ./Documentation/fpga/dfl.rst:
>     505: WARNING: Title underline too short.
>     523: WARNING: Unexpected indentation.
>     523: WARNING: Blank line required after table.
>     524: WARNING: Block quote ends without a blank line; unexpected unindent.
> 
> Rectify ReST formatting in ./Documentation/fpga/dfl.rst.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

You forgot a Reported-by: tag for the person who notified you of this :(
