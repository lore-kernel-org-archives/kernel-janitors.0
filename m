From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 03 Oct 2011 08:36:42 +0000
Subject: Re: [patch] pinctrl: double free on error path in pinctrl_register()
Message-Id: <CACRpkdZ8qdbTZshFyuYaeDVfUSb2j0AkNid-N=WRVRZpqaRSWg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111002202255.GA6991@elgon.mountain>
In-Reply-To: <20111002202255.GA6991@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Axel Lin <axel.lin@gmail.com>

On Sun, Oct 2, 2011 at 10:22 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This is duplicated in the error handling after we go to out_err.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This got fixed by Axel Lin's patch that arrived just a little bit
before this one,
but thanks anyway!

Yours,
Linus Walleij
