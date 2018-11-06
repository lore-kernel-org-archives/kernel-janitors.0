From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 06 Nov 2018 16:53:32 +0000
Subject: Re: [PATCH] wlcore: Fix the return value in case of error in 'wlcore_vendor_cmd_smart_config_start()
Message-Id: <20181106165332.9446F60BDE@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181016073940.26797-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181016073940.26797-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, tony@atomide.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> We return 0 unconditionally at the end of
> 'wlcore_vendor_cmd_smart_config_start()'.
> However, 'ret' is set to some error codes in several error handling paths
> and we already return some error codes at the beginning of the function.
> 
> Return 'ret' instead to propagate the error code.
> 
> Fixes: 80ff8063e87c ("wlcore: handle smart config vendor commands")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied to wireless-drivers-next.git, thanks.

3419348a97bc wlcore: Fix the return value in case of error in 'wlcore_vendor_cmd_smart_config_start()'

-- 
https://patchwork.kernel.org/patch/10643195/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
