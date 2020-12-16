From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 16 Dec 2020 11:01:08 +0000
Subject: Re: [PATCH 2/2] ath11k: Fix ath11k_pci_fix_l1ss()
Message-Id: <878s9yxbez.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9nGDHiTh+Z+asDy@mwanda>
In-Reply-To: <X9nGDHiTh+Z+asDy@mwanda> (Dan Carpenter's message of "Wed, 16
 Dec 2020 11:32:12 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> All these conditions are reversed so presumably most of the function is
> dead code.
>
> Fixes: 0699940755e9 ("ath11k: pci: fix L1ss clock unstable problem")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

And this caused a spurious warning:

[   95.734922] ath11k_pci 0000:06:00.0: failed to set sysclk: 0

I'll update the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
