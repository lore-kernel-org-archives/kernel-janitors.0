From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 08 Jun 2018 08:06:26 +0000
Subject: Re: [PATCH -next] pinctrl: mediatek: remove redundant return value check of platform_get_resource()
Message-Id: <CACRpkdY3YOAbsXHYu3m-0LUSf0FnXS6vO4+M3+=xUS_YuaydjQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527766782-72315-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527766782-72315-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, May 31, 2018 at 1:39 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Remove unneeded error handling on the result of a call
> to platform_get_resource() when the value is passed to
> devm_ioremap_resource().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied for fixes.

Yours,
Linus Walleij
