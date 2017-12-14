From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 14 Dec 2017 15:30:39 +0000
Subject: Re: ath9k_htc: Add a sanity check in ath9k_htc_ampdu_action()
Message-Id: <1ba6b3947c1441f38ef51d1e827ce62c@euamsexm01a.eu.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143508.qbnbm4d3wesguu2g@mwanda>
In-Reply-To: <20171205143508.qbnbm4d3wesguu2g@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Sujith <Sujith.Manoharan@atheros.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Smatch generates a warning here:
> 
>     drivers/net/wireless/ath/ath9k/htc_drv_main.c:1688 ath9k_htc_ampdu_action()
>     error: buffer overflow 'ista->tid_state' 8 <= 15
> 
> I don't know if it's a real bug or not but the other paths through this
> function all ensure that "tid" is less than ATH9K_HTC_MAX_TID (8) so
> checking here makes things more consistent.
> 
> Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

413fd2f5c023 ath9k_htc: Add a sanity check in ath9k_htc_ampdu_action()

-- 
https://patchwork.kernel.org/patch/10093021/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

