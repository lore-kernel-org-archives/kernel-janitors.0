From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 31 Jan 2018 12:58:57 +0000
Subject: Re: [PATCH] wireless: zd1211rw: remove redundant assignment of pointer 'q'
Message-Id: <CAHp75Vc_8v3qxWjtT4B3Kvz4dNZ8=-+uRPs-iTK3o8Taa4Swgw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180130182537.5580-1-colin.king@canonical.com>
In-Reply-To: <20180130182537.5580-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Daniel Drake <dsd@gentoo.org>, Ulrich Kunitz <kune@deine-taler.de>, Kalle Valo <kvalo@codeaurora.org>, "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>, netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jan 30, 2018 at 8:25 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer q is initialized and then almost immediately afterwards being
> re-assigned the same value. Remove the second redundant assignment.
>

Don't you see strange that in the same context of the patch two users
of q are present?

How did you test this?

> Cleans up clang warning:
> drivers/net/wireless/zydas/zd1211rw/zd_mac.c:503:23: warning: Value
> stored to 'q' during its initialization is never read

> -       q = &mac->ack_wait_queue;
>         spin_lock_irqsave(&q->lock, flags);
>
>         skb_queue_walk(q, skb) {



-- 
With Best Regards,
Andy Shevchenko
