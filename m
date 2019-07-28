From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jul 2019 10:00:14 +0000
Subject: Re: [PATCH][next] gpio: bd70528: remove redundant assignment to variable ret
Message-Id: <CACRpkdYaVT_j5Ky-nd8_1F0mG3yqBWaQ_ju8g2zSb1O+565ozw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190629123306.12519-1-colin.king@canonical.com>
In-Reply-To: <20190629123306.12519-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jun 29, 2019 at 2:33 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> Variable ret is being initialized with a value that is never read
> and ret is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
