From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Tue, 29 Sep 2009 10:57:28 +0000
Subject: Re: [PATCH] staging/et131x:  adding __init/__exit macros
Message-Id: <20090929115728.3346b06d@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200909290134.15295.PeterHuewe@gmx.de>
In-Reply-To: <200909290134.15295.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 29 Sep 2009 01:34:14 +0200
Peter Huewe <PeterHuewe@gmx.de> wrote:

> From: Peter Huewe <peterhuewe@gmx.de>
> 
> Trivial patch which adds the __init/__exit macros to the module_init/
> module_exit functions of ./staging/et131x/et131x_initpci.c
> 
> Greg, please have a look at the small patch and either pull it through
> your staging tree, or please ack' it so Jiri can pull it through the trivial tree.
> 
> linux version v2.6.32-rc1 - linus git tree, Di 29. Sep 01:10:18 CEST 2009
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Acked-by: Alan Cox <alan@linux.intel.com>
