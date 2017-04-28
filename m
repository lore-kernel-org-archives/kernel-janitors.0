From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Apr 2017 08:09:39 +0000
Subject: Re: [PATCH] gpio: f7188x: Add a missing break
Message-Id: <CACRpkdb=wia6hvVwVf6MphY86ATAr4KNxspOT6uCNyFiQutsKw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170426190815.vi2v3ef4j7ruspkg@mwanda>
In-Reply-To: <20170426190815.vi2v3ef4j7ruspkg@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marty Plummer <netz.kernel@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Apr 26, 2017 at 9:08 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> A break statement was obviously intended here.
>
> Fixes: d69843e416d3 ("gpio: f7188x: Add F71889A GPIO support.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
