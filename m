From: Olof Johansson <olof@lixom.net>
Date: Tue, 18 Jun 2019 13:48:11 +0000
Subject: Re: [PATCH] soc: ixp4xx: npe: Fix an IS_ERR() vs NULL check in probe
Message-Id: <20190618134811.bfs5lxazaw66ubb7@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CACRpkdaX66=g7dG7SFkgr5Dwmop-p4qe7ELkn0KERtqVvp0vNA@mail.gmail.com>
 <20190618115410.GE18776@kadam>
In-Reply-To: <20190618115410.GE18776@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: arm@kernel.org, Krzysztof Halasa <khalasa@piap.pl>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jun 18, 2019 at 02:54:10PM +0300, Dan Carpenter wrote:
> The devm_ioremap_resource() function doesn't return NULL, it returns
> error pointers.
> 
> Fixes: 0b458d7b10f8 ("soc: ixp4xx: npe: Pass addresses as resources")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thanks!


-Olof
