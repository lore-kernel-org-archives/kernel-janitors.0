From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 14 Aug 2020 15:05:22 +0000
Subject: Re: [PATCH 7/7] ath: drop unnecessary list_empty
Message-Id: <20200814150522.C0936C43391@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-8-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-8-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@inria.fr> wrote:

> list_for_each_entry{_safe} is able to handle an empty list.
> The only effect of avoiding the loop is not initializing the
> index variable.
> Drop list_empty tests in cases where these variables are not
> used.
> 
> Note that list_for_each_entry{_safe} is defined in terms of
> list_first_entry, which indicates that it should not be used on an
> empty list.  But in list_for_each_entry{_safe}, the element obtained
> by list_first_entry is not really accessed, only the address of its
> list_head field is compared to the address of the list head, so the
> list_first_entry is safe.
> 
> The semantic patch that makes this change for the list_for_each_entry
> case is as follows: (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@
> expression x,e;
> statement S;
> identifier i;
> @@
> 
> -if (!(list_empty(x)))
>    list_for_each_entry(i,x,...) S
>  ... when != i
> ? i = e
> </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

18c25b4019ca ath: drop unnecessary list_empty

-- 
https://patchwork.kernel.org/patch/11685677/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
