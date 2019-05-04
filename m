From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 04 May 2019 11:59:13 +0000
Subject: Re: [PATCH] soc: ixp4xx: qmgr: Fix an NULL vs IS_ERR() check in probe
Message-Id: <CACRpkdajJgP6zAYOw3zRVjtPj-dEoA0ZtrMerPMkxW046aEQ7w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503131651.GC1236@mwanda>
In-Reply-To: <20190503131651.GC1236@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Krzysztof Halasa <khalasa@piap.pl>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, May 3, 2019 at 3:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The devm_ioremap_resource() function doesn't retunr NULL, it returns
> error pointers.
>
> Fixes: ecc133c6da60 ("soc: ixp4xx: qmgr: Pass resources")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch! Patch applied.

I will make sure this fix lands in ARM SoC for v5.2.

Yours,
Linus Walleij
