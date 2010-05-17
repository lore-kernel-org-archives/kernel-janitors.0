From: Kalle Valo <kvalo@adurom.com>
Date: Mon, 17 May 2010 07:47:17 +0000
Subject: Re: [PATCH 7/37] drivers/net/wireless/wl12xx: Use kmemdup
Message-Id: <AANLkTimPDHCFcMruCqNUZKsbvKuszh5gWA052SgaPTkD@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152314540.21345@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005152314540.21345@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 16 May 2010 00:15, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Use kmemdup when some other buffer is immediately copied into the
> allocated region.

Thanks, looks good to me.

> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Kalle Valo <kvalo@adurom.com>
