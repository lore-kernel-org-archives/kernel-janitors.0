From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Nov 2014 11:57:57 +0000
Subject: Re: [PATCH 6/6] dmaengine: ste_dma40: fix error return code
Message-Id: <CACRpkdaobn4Zp8KYM-wA1L_uL8CHZW6K6yNb3dE=hSuHcxj6+w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416667159-9808-1-git-send-email-Julia.Lawall@lip6.fr>
 <1416667159-9808-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416667159-9808-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sat, Nov 22, 2014 at 3:39 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Return a negative error code on failure.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier ret; expression e1,e2;
> @@
> (
> if (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret = 0
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
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
