From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 13 Jan 2015 14:16:40 +0000
Subject: Re: [PATCH 8/8] ath10k: fix error return code
Message-Id: <87ppai6a0n.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419872683-32709-1-git-send-email-Julia.Lawall@lip6.fr>
 <1419872683-32709-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419872683-32709-9-git-send-email-Julia.Lawall@lip6.fr> (Julia
 Lawall's message of "Mon, 29 Dec 2014 18:04:43 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, netdev@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

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

Thanks, applied to ath.git.

-- 
Kalle Valo
