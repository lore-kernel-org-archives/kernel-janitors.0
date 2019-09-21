From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 21 Sep 2019 06:31:30 +0000
Subject: Re: [PATCH] wil6210: use after free in wil_netif_rx_any()
Message-Id: <87lfuib1od.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190921060145.GD18726@mwanda>
In-Reply-To: <20190921060145.GD18726@mwanda> (Dan Carpenter's message of "Sat,
        21 Sep 2019 09:01:45 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maya Erez <merez@codeaurora.org>, Dedy Lansky <dlansky@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The debug code dereferences "skb" to print "skb->len" so we have to
> print the message before we free "skb".
>
> Fixes: f99fe49ff372 ("wil6210: add wil_netif_rx() helper function")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

As this is a regression starting from v5.4-rc1, I'll queue this to v5.4.

-- 
Kalle Valo
