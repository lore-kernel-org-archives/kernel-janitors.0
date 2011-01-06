From: David Miller <davem@davemloft.net>
Date: Thu, 06 Jan 2011 19:17:12 +0000
Subject: Re: [patch 2/2] dcb: use after free in dcb_flushapp()
Message-Id: <20110106.111712.183045224.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110105070344.GB24847@bicker>
In-Reply-To: <20110105070344.GB24847@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, john.r.fastabend@intel.com, shmulikr@broadcom.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 5 Jan 2011 10:03:44 +0300

> The original code has a use after free bug because it's not using the
> _safe() version of the list_for_each_entry() macro.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Also applied.
