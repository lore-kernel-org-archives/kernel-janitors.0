From: David Miller <davem@davemloft.net>
Date: Thu, 23 Jun 2011 10:14:53 +0000
Subject: Re: [patch -next] dcb: use nlmsg_free() instead of kfree()
Message-Id: <20110623.031453.2027432684696519466.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110623055802.GN14591@shale.localdomain>
In-Reply-To: <20110623055802.GN14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: john.r.fastabend@intel.com, shmulikr@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Thu, 23 Jun 2011 08:58:02 +0300

> These sk_buff structs were allocated with nlmsg_new() so they should
> be freed with nlmsg_free().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
