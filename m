From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 17 Dec 2020 06:48:41 +0000
Subject: Re: [PATCH 1/2] ath11k: Fix error code in ath11k_core_suspend()
Message-Id: <20201217064841.3188EC43462@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9nF17L2/EKOSbn/@mwanda>
In-Reply-To: <X9nF17L2/EKOSbn/@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "if (!ret)" condition is inverted and it should be "if (ret)".  It means
> that we return success when we had intended to return an error code. This also
> caused a spurious warning even when the suspend was successful:
> 
> [  297.186612] ath11k_pci 0000:06:00.0: failed to suspend hif: 0
> 
> Fixes: d1b0c33850d2 ("ath11k: implement suspend for QCA6390 PCI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-current branch of ath.git, thanks.

9b09456258ea ath11k: Fix error code in ath11k_core_suspend()
30d085039314 ath11k: Fix ath11k_pci_fix_l1ss()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/X9nF17L2/EKOSbn/@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
