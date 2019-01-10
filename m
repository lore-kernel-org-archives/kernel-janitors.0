From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 10 Jan 2019 11:36:07 +0000
Subject: Re: [PATCH 20/20] cw1200: drop useless LIST_HEAD
Message-Id: <20190110113607.3AD05601D1@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-21-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-21-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Solomon Peachy <pizza@shaftnet.org>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Drop LIST_HEAD where the variable it declares has never
> been used.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier x;
> @@
> - LIST_HEAD(x);
>   ... when != x
> // </smpl>
> 
> Fixes: a910e4a94f692 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied to wireless-drivers-next.git, thanks.

06605b0d38b4 cw1200: drop useless LIST_HEAD

-- 
https://patchwork.kernel.org/patch/10741603/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
