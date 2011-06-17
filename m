From: David Miller <davem@davemloft.net>
Date: Fri, 17 Jun 2011 04:03:54 +0000
Subject: Re: [PATCH] e1000: remove unnecessary code
Message-Id: <20110617.000354.1905086622786619545.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308244170-30304-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1308244170-30304-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gregory.Dietsche@cuw.edu
Cc: kernel-janitors@vger.kernel.org, e1000-devel@lists.sourceforge.net, bruce.w.allan@intel.com, jesse.brandeburg@intel.com, john.ronciak@intel.com, netdev@vger.kernel.org

From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Thu, 16 Jun 2011 12:09:30 -0500

> Compile tested.
> remove unnecessary code that matches this coccinelle pattern
> 	if (...)
> 		return ret;
> 	return ret;
> 
> Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>

Applied.
