From: Roland Dreier <rdreier@cisco.com>
Date: Wed, 14 Nov 2007 20:54:52 +0000
Subject: Re: [PATCH 3/4] drivers/infiniband: Drop redundant includes of moduleparam.h
Message-Id: <adalk90zgwz.fsf@cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0711132234110.18337@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0711132234110.18337@ask.diku.dk> (Julia Lawall's message of "Tue, 13 Nov 2007 22:35:14 +0100 (CET)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: rolandd@cisco.com, mshefty@ichips.intel.com, halr@voltaire.com, openib-general@openib.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

 > Drop #include <linux/moduleparam.h> in files that also include #include
 > <linux/module.h>.  module.h includes moduleparam.h already.

Do we want to make this sort of source code change?  I thought that
the consensus about the kernel was that we wanted to avoid relying of
implicit includes of <Y.h> by <X.h> -- in this case a better change
would actually seem to be to explicitly include moduleparam.h in files
using module parameters and then remove the include from module.h.

 - R.
