From: Kalle Valo <kvalo@adurom.com>
Date: Mon, 16 Aug 2010 17:47:56 +0000
Subject: Re: [PATCH 3/16] drivers/net/wireless/wl12xx: Use available error
Message-Id: <4C6979CC.80107@adurom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008161825010.19313@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008161825010.19313@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/16/2010 07:25 PM, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> In each case, error codes are stored in ret, but the return value is always
> 0.  Return ret instead.

Thanks, looks correct to me.

Acked-by: Kalle Valo <kvalo@adurom.com>

Kalle
