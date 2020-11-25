From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Nov 2020 20:59:16 +0000
Subject: Re: [PATCH][next] drm/mcde: fix masking and bitwise-or on variable val
Message-Id: <CACRpkdbh_d14y2a3zA2HZvfx1hSWw8wQBQ7WZGgp2f4wqzdwkw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201124121528.395681-1-colin.king@canonical.com>
In-Reply-To: <20201124121528.395681-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>

On Tue, Nov 24, 2020 at 1:15 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The masking of val with ~MCDE_CRX1_CLKSEL_MASK is currently being
> ignored because there seems to be a missing bitwise-or of val in the
> following statement.  Fix this by replacing the assignment of val
> with a bitwise-or.
>
> Addresses-Coverity: ("Unused valued")
> Fixes: d795fd322063 ("drm/mcde: Support DPI output")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Nice catch!
Patch applied.

Yours,
Linus Walleij
