From: Mel Gorman <mgorman@suse.de>
Date: Wed, 25 Jul 2012 08:09:24 +0000
Subject: Re: [next:akpm 121/309] include/linux/page-flags.h:462:2: error: implicit declaration of function 'V
Message-Id: <20120725080924.GX9222@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120722163512.GC13376@localhost>
In-Reply-To: <20120722163512.GC13376@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 24, 2012 at 09:07:11PM +0000, Luck, Tony wrote:
> Looks like include/linux/page-flags.h (which uses VM_BUG_ON) needs to have a
> 
> #include <linux/mmdebug.h>
> 
> to make sure it sees the define.
> 

There should be a patch in-flight to Andrew's tree that fixes this.
Thanks Tony.

-- 
Mel Gorman
SUSE Labs
