From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 19 May 2020 06:56:00 +0000
Subject: Re: [PATCH] ath11k: Fix some resource leaks in error path in 'ath11k_thermal_register()'
Message-Id: <20200519065600.C7ADBC44788@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513201454.258111-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200513201454.258111-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, pradeepc@codeaurora.org, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> If 'thermal_cooling_device_register()' fails, we must undo what has been
> allocated so far. So we must go to 'err_thermal_destroy' instead of
> returning directly
> 
> In case of error in 'ath11k_thermal_register()', the previous
> 'thermal_cooling_device_register()' call must also be undone. Move the
> 'ar->thermal.cdev = cdev' a few lines above in order for this to be done
> in 'ath11k_thermal_unregister()' which is called in the error handling
> path.
> 
> Fixes: 2a63bbca06b2 ("ath11k: add thermal cooling device support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

25ca180ad380 ath11k: Fix some resource leaks in error path in 'ath11k_thermal_register()'

-- 
https://patchwork.kernel.org/patch/11547195/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
