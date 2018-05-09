From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 09 May 2018 10:25:56 +0000
Subject: Re: mwifiex: delete unneeded include
Message-Id: <20180509102556.9EB8260F92@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1525593233-10968-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1525593233-10968-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, kernel-janitors@vger.kernel.org, Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, Xinming Hu <huxm@marvell.com>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Nothing that is defined in 11ac.h is referenced in cmdevt.c.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied to wireless-drivers-next.git, thanks.

4793e5a954fa mwifiex: delete unneeded include

-- 
https://patchwork.kernel.org/patch/10382667/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

