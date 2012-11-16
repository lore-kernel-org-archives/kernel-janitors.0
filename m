From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 16 Nov 2012 11:39:51 +0000
Subject: Re: [PATCH 8/8] drivers/net/wireless/ath/ath6kl/hif.c: drop if around WARN_ON
Message-Id: <50A62607.4060900@qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr> <1351974625-10282-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351974625-10282-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/03/2012 10:30 PM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Just use WARN_ON rather than an if containing only WARN_ON(1).
> 
> A simplified version of the semantic patch that makes this transformation
> is as follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e;
> @@
> - if (e) WARN_ON(1);
> + WARN_ON(e);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, applied to ath6kl.git.

Kalle
