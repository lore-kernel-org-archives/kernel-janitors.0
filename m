From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2019 11:35:19 +0000
Subject: Re: [PATCH] soc: ixp4xx: npe: Fix an IS_ERR() vs NULL check in probe
Message-Id: <CACRpkdaX66=g7dG7SFkgr5Dwmop-p4qe7ELkn0KERtqVvp0vNA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613070201.GH16334@mwanda>
In-Reply-To: <20190613070201.GH16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Krzysztof Halasa <khalasa@piap.pl>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Olof Johansson <olof@lixom.net>

On Thu, Jun 13, 2019 at 9:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The devm_ioremap_resource() function doesn't return NULL, it returns
> error pointers.
>
> Fixes: 0b458d7b10f8 ("soc: ixp4xx: npe: Pass addresses as resources")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can you please collect my review and send this to the ARM SoC maintainers
arm@kernel.org since they are collecting a few other IXP4xx fixes?

Yours,
Linus Walleij
