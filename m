From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Jun 2017 13:50:33 +0000
Subject: Re: [PATCH] pinctrl: rza1: fix incorrect failure check on platform_get_resources
Message-Id: <CACRpkdbbk74DhCeQ2h=3-innkRCAqk_x-iqhVUc0YgM7G=YuNg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630103355.9769-1-colin.king@canonical.com>
In-Reply-To: <20170630103355.9769-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 30, 2017 at 12:33 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The return res from platform_get_resources should be checked for
> a failure rather than ret.  Fixes warning:
>
> 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Geert already sent the right fix for this.

Yours,
Linus Walleij
