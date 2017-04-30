From: Marty Plummer <netz.kernel@gmail.com>
Date: Sun, 30 Apr 2017 23:45:01 +0000
Subject: Re: [PATCH] gpio: f7188x: Add a missing break
Message-Id: <20170430234500.lb4gp6jvuclziltp@tha-monstah.mydomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170426190815.vi2v3ef4j7ruspkg@mwanda>
 <CACRpkdb=wia6hvVwVf6MphY86ATAr4KNxspOT6uCNyFiQutsKw@mail.gmail.com>
In-Reply-To: <CACRpkdb=wia6hvVwVf6MphY86ATAr4KNxspOT6uCNyFiQutsKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Apr 28, 2017 at 10:09:39AM +0200, Linus Walleij wrote:
> On Wed, Apr 26, 2017 at 9:08 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > A break statement was obviously intended here.
> >
> > Fixes: d69843e416d3 ("gpio: f7188x: Add F71889A GPIO support.")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Patch applied.
> 
> Yours,
> Linus Walleij
How embarrassing, I completely missed that. Good catch.

Marty.
