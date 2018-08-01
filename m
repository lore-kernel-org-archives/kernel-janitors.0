From: David Miller <davem@davemloft.net>
Date: Wed, 01 Aug 2018 19:03:17 +0000
Subject: Re: [PATCH] qede: fix null pointer dereference on skb on allocation failure
Message-Id: <20180801.120317.1723805727309880042.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180801163947.22743-1-colin.king@canonical.com>
In-Reply-To: <20180801163947.22743-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  1 Aug 2018 17:39:47 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> If skb fails to be allocated with the call to build_skb then a
> null pointer dereference will occur on the call to skb_reserve.
> Fix this by checking for a null skb and returning NULL.
> 
> Detected by CoverityScan, CID#1469485 ("Dereference null return value")
> 
> Fixes: 8a8633978b84 ("qede: Add build_skb() support.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This is in no way sufficient.

The caller doesn't check the return value, so you're just pushing
the problem one function level up.

In fact, the caller is going to take a reference on the page
whether this returns NULL or not, thus leaking that memory.

The whole call chain needs to be fixed to handle build_skb()
errors, not just this one function.

Thanks.
