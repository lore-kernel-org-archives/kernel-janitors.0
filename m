From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 06 Sep 2018 12:44:01 +0000
Subject: Re: [PATCH] gpio: ep93xx: fix incorrect array element size check
Message-Id: <CACRpkdaHabhD_pW3XtDh+XzQ3d--r=qNRZVnhx44RV82p0boMA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180906115830.19386-1-colin.king@canonical.com>
In-Reply-To: <20180906115830.19386-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 6, 2018 at 1:58 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the while loop checks for the end of the array using
> the size of egp->gc rather that the number of elements in the array,
> so fix this. Also, perform the array size check first as stylistically
> it is always good to bounds check on an array first before referencing
> the array (in this case, we're just computing the address of an
> element in an array so this is a moot point).
>
> Fixes: fd935fc421e7 ("gpio: ep93xx: Do not pingpong irq numbers")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Oh that was really neat code! Thanks a lot.

Patch applied.

Yours,
Linus Walleij
