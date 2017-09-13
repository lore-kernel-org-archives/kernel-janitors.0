From: Daniel Drake <drake@endlessm.com>
Date: Wed, 13 Sep 2017 23:33:31 +0000
Subject: Re: [PATCH][pinctrl-next] pinctrl/amd: make functions amd_gpio_suspend and amd_gpio_resume static
Message-Id: <CAD8Lp45RpFwFALmbsr8jRqtUFx8MxTveV-ruBsLon8VbnEBApg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170913161501.7356-1-colin.king@canonical.com>
In-Reply-To: <20170913161501.7356-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

On Thu, Sep 14, 2017 at 12:15 AM, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The functions amd_gpio_suspend and amd_gpio_resume are local to the
> source and do not need to be in global scope, so make them static.
>
> Cleans up sparse warnings:
> symbol 'amd_gpio_suspend' was not declared. Should it be static?
> symbol 'amd_gpio_resume' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>
