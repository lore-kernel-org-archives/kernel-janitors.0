From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Tue, 05 Dec 2017 22:34:15 +0000
Subject: Re: [PATCH] w1: remove redundant assignments to search_bit and last_rn
Message-Id: <803221512513255@web55j.yandex.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107184914.7561-1-colin.king@canonical.com>
In-Reply-To: <20171107184914.7561-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi

07.11.2017, 21:49, "Colin King" <colin.king@canonical.com>:
> From: Colin Ian King <colin.king@canonical.com>
>
> Variables search_bit and last_rn are assigned values before a while-loop
> however these initial values are never read (as they are overwritten
> inside the loop). Thus these initial assignments are redundant and can
> be removed. Cleans up clang warnings:
>
> drivers/w1/w1.c:967:2: warning: Value stored to 'search_bit' is never
> read
> drivers/w1/w1.c:969:2: warning: Value stored to 'last_rn' is never read

This looks good, thank you.
Please pull it into janitors tree if you haven't yet.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

> ---
>  drivers/w1/w1.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index 0c2a5a8327bd..c29f6c5dda3c 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -964,9 +964,7 @@ void w1_search(struct w1_master *dev, u8 search_type, w1_slave_found_callback cb
>          int search_bit, desc_bit;
>          u8 triplet_ret = 0;
>
> - search_bit = 0;
>          rn = dev->search_id;
> - last_rn = 0;
>          last_device = 0;
>          last_zero = -1;
>
> --
> 2.14.1
