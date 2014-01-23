From: David Miller <davem@davemloft.net>
Date: Thu, 23 Jan 2014 21:29:03 +0000
Subject: Re: [patch] tulip: cleanup by using ARRAY_SIZE()
Message-Id: <20140123.132903.1418930141853313681.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140123082637.GC28688@elgon.mountain>
In-Reply-To: <20140123082637.GC28688@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: grundler@parisc-linux.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Jan 2014 11:26:37 +0300

> In this situation then ARRAY_SIZE() and sizeof() are the same, but we're
> really dealing with array indexes and not byte offsets so ARRAY_SIZE()
> is cleaner.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
