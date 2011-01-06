From: David Miller <davem@davemloft.net>
Date: Thu, 06 Jan 2011 19:17:06 +0000
Subject: Re: [patch 1/2] dcb: unlock on error in dcbnl_ieee_get()
Message-Id: <20110106.111706.112600632.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110105070312.GA24847@bicker>
In-Reply-To: <20110105070312.GA24847@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, john.r.fastabend@intel.com, shmulikr@broadcom.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Wed, 5 Jan 2011 10:03:12 +0300

> There is a "goto nla_put_failure" hidden inside the NLA_PUT() macro, but
> we're holding the dcb_lock so we need to unlock first.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
