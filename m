From: Arun Murthy <arunrmurthy.83@gmail.com>
Date: Mon, 24 Sep 2012 12:13:55 +0000
Subject: Re: [PATCH 1/4] drivers/crypto/ux500/cryp/cryp_core.c: fix error return code
Message-Id: <CAAnUQp3g6hGo1m6yZG76ifGxpuQRzYBk51ZsaNAVkgYLwMhjZw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347902908-19006-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347902908-19006-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, linus.walleij@linaro.org, andreas.westin@stericsson.com, rjw@sisk.pl, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Sep 17, 2012 at 10:58 PM, Peter Senna Tschudin
<peter.senna@gmail.com> wrote:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
> // </smpl>
>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Reviewed-by: Arun Murthy <arunrmurthy83@gmail.com>
