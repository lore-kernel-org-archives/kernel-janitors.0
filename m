From: Hans-Christian Egtvedt <egtvedt@samfundet.no>
Date: Thu, 07 Aug 2014 13:00:04 +0000
Subject: Re: [PATCH 1/5] avr32: fix error return code
Message-Id: <20140807130004.GA10918@samfundet.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407415749-19978-1-git-send-email-Julia.Lawall@lip6.fr>
 <1407415749-19978-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407415749-19978-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Haavard Skinnemoen <hskinnemoen@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Around Thu 07 Aug 2014 14:49:05 +0200 or thereabout, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Convert a zero return value on error to a negative one, as returned
> elsewhere in the function.

Excellent find, added to this for-linus branch.

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

Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>

> ---
>  arch/avr32/boards/hammerhead/flash.c |   11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

<snipp diff>

-- 
mvh
Hans-Christian Egtvedt
