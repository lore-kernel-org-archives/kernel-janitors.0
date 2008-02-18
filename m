From: David Miller <davem@davemloft.net>
Date: Mon, 18 Feb 2008 02:43:06 +0000
Subject: Re: [PATCH 7/7] net/9p/trans_virtio.c: Use BUG_ON
Message-Id: <20080217.184306.207904047.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802171857310.28055@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802171857310.28055@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: ericvh@gmail.com, rminnich@sandia.gov, lucho@ionkov.net, v9fs-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Feb 2008 18:57:58 +0100 (CET)

> if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
> side-effects to allow a definition of BUG_ON that drops the code completely.
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks.
