From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 29 Sep 2009 09:10:01 +0000
Subject: Re: [PATCH] staging/et131x:  adding __init/__exit macros
Message-Id: <alpine.LSU.2.00.0909291107410.9280@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200909290134.15295.PeterHuewe@gmx.de>
In-Reply-To: <200909290134.15295.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 29 Sep 2009, Peter Huewe wrote:

> From: Peter Huewe <peterhuewe@gmx.de>
> 
> Trivial patch which adds the __init/__exit macros to the module_init/
> module_exit functions of ./staging/et131x/et131x_initpci.c
> 
> Greg, please have a look at the small patch and either pull it through
> your staging tree, or please ack' it so Jiri can pull it through the trivial tree.

Greg -- I'd prefer you taking trivial staging fixes through yoru tree, as 
I expect we'll be conflicting soon due to the speed of changes in staging 
area, if you don't have any objections.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
