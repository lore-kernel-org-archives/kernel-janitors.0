From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 14 Nov 2007 21:00:52 +0000
Subject: Re: [PATCH 3/4] drivers/infiniband: Drop redundant includes of
Message-Id: <20071114130052.8118c397.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711132234110.18337@ask.diku.dk>
	<adalk90zgwz.fsf@cisco.com>
In-Reply-To: <adalk90zgwz.fsf@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Dreier <rdreier@cisco.com>
Cc: Julia Lawall <julia@diku.dk>, rolandd@cisco.com, mshefty@ichips.intel.com, halr@voltaire.com, openib-general@openib.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 14 Nov 2007 12:54:52 -0800 Roland Dreier wrote:

>  > Drop #include <linux/moduleparam.h> in files that also include #include
>  > <linux/module.h>.  module.h includes moduleparam.h already.
> 
> Do we want to make this sort of source code change?  I thought that
> the consensus about the kernel was that we wanted to avoid relying of
> implicit includes of <Y.h> by <X.h> -- in this case a better change
> would actually seem to be to explicitly include moduleparam.h in files
> using module parameters and then remove the include from module.h.

That's correct AFAIK (what Roland said).

---
~Randy
