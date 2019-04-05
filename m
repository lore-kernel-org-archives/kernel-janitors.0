From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 05 Apr 2019 10:58:17 +0000
Subject: Re: [PATCH -next] gpio: mlxbf: remove unused including <linux/version.h>
Message-Id: <CACRpkdY+HH1c7ZW+_3gqt6woATPFq-puJahG83J4P3j50pryZA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328013958.33849-1-yuehaibing@huawei.com>
In-Reply-To: <20190328013958.33849-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Mar 28, 2019 at 8:28 AM YueHaibing <yuehaibing@huawei.com> wrote:

> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

I put this on hold so Bartosz can apply it to his patch stack
where the dependent patches are queued.

Yours,
Linus Walleij
