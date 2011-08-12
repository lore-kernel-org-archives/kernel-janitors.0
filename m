From: Luciano Coelho <coelho@ti.com>
Date: Fri, 12 Aug 2011 05:14:01 +0000
Subject: Re: [PATCH 2/9] drivers/net/wireless/wl12xx: add missing kfree
Message-Id: <1313126041.2407.911.camel@cumari>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312802283-9107-2-git-send-email-julia@diku.dk>
In-Reply-To: <1312802283-9107-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Mon, 2011-08-08 at 13:17 +0200, Julia Lawall wrote: 
> From: Julia Lawall <julia@diku.dk>
> 
> In each case, the freed data should be freed in the error handling code as
> well.

[...]

> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---

John, since you took Julia's patch for wl1251 into 3.1, could you also
take this patch into it, please?

Acked-by: Luciano Coelho <coelho@ti.com>

-- 
Cheers,
Luca.

