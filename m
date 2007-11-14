From: Julia Lawall <julia@diku.dk>
Date: Wed, 14 Nov 2007 21:18:07 +0000
Subject: Re: [PATCH 3/4] drivers/infiniband: Drop redundant includes of
Message-Id: <Pine.LNX.4.64.0711142214120.31186@tyr.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711132234110.18337@ask.diku.dk> <adalk90zgwz.fsf@cisco.com>
In-Reply-To: <adalk90zgwz.fsf@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: rolandd@cisco.com, mshefty@ichips.intel.com, halr@voltaire.com, openib-general@openib.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 14 Nov 2007, Roland Dreier wrote:

> > Drop #include <linux/moduleparam.h> in files that also include #include
> > <linux/module.h>.  module.h includes moduleparam.h already.
>
> Do we want to make this sort of source code change?  I thought that
> the consensus about the kernel was that we wanted to avoid relying of
> implicit includes of <Y.h> by <X.h> -- in this case a better change
> would actually seem to be to explicitly include moduleparam.h in files
> using module parameters and then remove the include from module.h.

Someone else made a similar comment, so it seems reasonable to forget 
about the patches.

I could easily make a patch to go the other way if there is an interest in 
that.  On the other hand, perhaps the concensus is to just leave things 
as they are.

julia

