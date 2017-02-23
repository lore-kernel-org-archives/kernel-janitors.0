From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Feb 2017 13:52:53 +0000
Subject: Re: [patch] gpio: mockup: return -EFAULT if copy_from_user() fails
Message-Id: <CACRpkdYtcY2Jp2_Uc-wooKA5U7H4mz4foX+vMCVsUXYUdfx_Dg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170214230206.GA4048@mwanda>
In-Reply-To: <20170214230206.GA4048@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 15, 2017 at 12:02 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> copy_from_user() returns the number of bytes remaining to be copied but
> we want to return negative error codes on failue.
>
> Fixes: 9202ba2397d1 ("gpio: mockup: implement event injecting over debugfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied for fixes.

Yours,
Linus Walleij
