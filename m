From: David Miller <davem@davemloft.net>
Date: Sun, 17 Feb 2019 02:14:35 +0000
Subject: Re: [PATCH] atm: clean up vcc_seq_next()
Message-Id: <20190216.181435.357732120744308938.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190214065635.GA21768@kadam>
In-Reply-To: <20190214065635.GA21768@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: joe@perches.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Feb 2019 09:56:35 +0300

> It's confusing to call PTR_ERR(v).  The PTR_ERR() function is basically
> a fancy cast to long so it makes you wonder, was IS_ERR() intended?  But
> that doesn't make sense because vcc_walk() doesn't return error
> pointers.
> 
> This patch doesn't affect runtime, it's just a cleanup.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
