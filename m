From: David Miller <davem@davemloft.net>
Date: Mon, 18 Feb 2008 02:42:22 +0000
Subject: Re: [PATCH 5/7] net/rxrpc: Use BUG_ON
Message-Id: <20080217.184222.129385804.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802171856240.28055@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802171856240.28055@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Feb 2008 18:56:52 +0100 (CET)

> if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
> side-effects to allow a definition of BUG_ON that drops the code completely.
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks.
