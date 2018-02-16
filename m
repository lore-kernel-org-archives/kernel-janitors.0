From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 16 Feb 2018 14:22:50 +0000
Subject: Re: [PATCH] rtc: tx4939: avoid unintended sign extension on a 24 bit shift
Message-Id: <CAHp75Vf+ky3Ma1b20x57i9z+ykS1j8k1LTuOT3f=Jbu5kCeeAQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215185941.27547-1-colin.king@canonical.com>
In-Reply-To: <20180215185941.27547-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Feb 15, 2018 at 8:59 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The shifting of buf[5] by 24 bits to the left will be promoted to
> a 32 bit signed int and then sign-extended to an unsigned long. If
> the top bit of buf[5] is set then all then all the upper bits sec
> end up as also being set because of the sign-extension. Fix this by
> casting buf[5] to an unsigned long before the shift.
>
> Detected by CoverityScan, CID#1465292 ("Unintended sign extension")
>
> Fixes: 0e1492330cd2 ("rtc: add rtc-tx4939 driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

>         spin_unlock_irq(&pdata->lock);
> -       sec = (buf[5] << 24) | (buf[4] << 16) | (buf[3] << 8) | buf[2];
> +       sec = ((unsigned long)buf[5] << 24) | (buf[4] << 16) |
> +               (buf[3] << 8) | buf[2];

Wouldn't be better to use le32_to_cpu() or get_unaligned()?

-- 
With Best Regards,
Andy Shevchenko
