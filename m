From: David Miller <davem@davemloft.net>
Date: Tue, 07 Sep 2010 01:39:57 +0000
Subject: Re: [PATCH 3/8] net/9p/trans_fd.c: Fix unsigned return type
Message-Id: <20100906.183957.13763018.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283713226-8429-1-git-send-email-julia@diku.dk>
	<1283713226-8429-4-git-send-email-julia@diku.dk>
In-Reply-To: <1283713226-8429-4-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun,  5 Sep 2010 21:00:21 +0200

> The function has an unsigned return type, but returns a negative constant
> to indicate an error condition.  The result of calling the function is
> always stored in a variable of type (signed) int, and thus unsigned can be
> dropped from the return type.
> 
> A sematic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
