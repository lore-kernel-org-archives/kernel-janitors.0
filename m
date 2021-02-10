From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 10 Feb 2021 07:46:27 +0000
Subject: Re: [PATCH v2] ath11k: fix a locking bug in ath11k_mac_op_start()
Message-Id: <20210210074627.04D54C43463@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBk4GoeE+yc0wlJH@mwanda>
In-Reply-To: <YBk4GoeE+yc0wlJH@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Peter Oh <peter.oh@eero.com>, Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This error path leads to a Smatch warning:
> 
> 	drivers/net/wireless/ath/ath11k/mac.c:4269 ath11k_mac_op_start()
> 	error: double unlocked '&ar->conf_mutex' (orig line 4251)
> 
> We're not holding the lock when we do the "goto err;" so it leads to a
> double unlock.  The fix is to hold the lock for a little longer.
> 
> Fixes: c83c500b55b6 ("ath11k: enable idle power save mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> [kvalo@codeaurora.org: move also rcu_assign_pointer() call]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c202e2ebe1dc ath11k: fix a locking bug in ath11k_mac_op_start()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/YBk4GoeE+yc0wlJH@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
