From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 06 Sep 2018 14:31:49 +0000
Subject: Re: [PATCH] gpio: ep93xx: fix test for end of loop
Message-Id: <CACRpkdakEX+3aknFj8f7q97bqQvZXDqaRNG8wqFG4bWBb=tPmg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CACRpkdaHabhD_pW3XtDh+XzQ3d--r=qNRZVnhx44RV82p0boMA@mail.gmail.com>
 <20180906133348.brzvqt53nzukn7n2@kili.mountain>
In-Reply-To: <20180906133348.brzvqt53nzukn7n2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Colin King <colin.king@canonical.com>

On Thu, Sep 6, 2018 at 3:34 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The problem is that if port = ARRAY_SIZE() and "gc = &epg->gc[port]"
> then that should be treated as invalid.
>
> Fixes: fd935fc421e7 ("gpio: ep93xx: Do not pingpong irq numbers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied!

Yours,
Linus Walleij
