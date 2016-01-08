From: David Miller <davem@davemloft.net>
Date: Fri, 08 Jan 2016 18:27:41 +0000
Subject: Re: [patch] irda: toim3232-sir: delete some dead code
Message-Id: <20160108.132741.1446598974134094010.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160108110404.GL32195@mwanda>
In-Reply-To: <20160108110404.GL32195@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: samuel@sortiz.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 8 Jan 2016 14:04:04 +0300

> I noticed this code because it has a typo in the module_param(),
> the "trs" at the end of "toim3232fliptrs" should be "rts".  But it's
> dead code so instead of fixing it, I just deleted it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Also applied, thanks Dan.
