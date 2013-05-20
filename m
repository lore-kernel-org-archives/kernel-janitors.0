From: David Miller <davem@davemloft.net>
Date: Mon, 20 May 2013 20:38:34 +0000
Subject: Re: [patch] isdn/kcapi: fix a small underflow
Message-Id: <20130520.133834.1122105618365256928.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130519183636.GA25275@elgon.mountain>
In-Reply-To: <20130519183636.GA25275@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 19 May 2013 21:36:36 +0300

> In get_capi_ctr_by_nr() and get_capi_appl_by_nr() the parameter comes
> from skb->data.  The current code can underflow to one space before the
> start of the array.
> 
> The sanity check isn't needed in __get_capi_appl_by_nr() but I changed
> it to match the others.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
