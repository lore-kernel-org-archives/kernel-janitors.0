From: David Miller <davem@davemloft.net>
Date: Sun, 05 May 2019 17:26:11 +0000
Subject: Re: [PATCH net] net: atm: clean up a range check
Message-Id: <20190505.102611.257025800032151893.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503123948.GD29695@mwanda>
In-Reply-To: <20190503123948.GD29695@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: gustavo@embeddedor.com, dwmw2@infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 3 May 2019 15:39:48 +0300

> The code works fine but the problem is that check for negatives is a
> no-op:
> 
> 	if (arg < 0)
> 		i = 0;
> 
> The "i" value isn't used.  We immediately overwrite it with:
> 
> 	i = array_index_nospec(arg, MAX_LEC_ITF);
> 
> The array_index_nospec() macro returns zero if "arg" is out of bounds so
> this works, but the dead code is confusing and it doesn't look very
> intentional.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This applies to net, but it's just a clean up.

I'm applying this to net-next, thanks Dan.
