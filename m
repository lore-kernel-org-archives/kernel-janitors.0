From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 06 Nov 2018 16:43:49 +0000
Subject: Re: [PATCH] ath9k: Fix a locking bug in ath9k_add_interface()
Message-Id: <20181106164349.C66C5601DA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019200842.7qclbjs547sm7mbn@kili.mountain>
In-Reply-To: <20181019200842.7qclbjs547sm7mbn@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We tried to revert commit d9c52fd17cb4 ("ath9k: fix tx99 with monitor
> mode interface") but accidentally missed part of the locking change.
> 
> The lock has to be held earlier so that we're holding it when we do
> "sc->tx99_vif = vif;" and also there in the current code there is a
> stray unlock before we have taken the lock.
> 
> Fixes: 6df0580be8bc ("ath9k: add back support for using active monitor interfaces for tx99")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers.git, thanks.

461cf0360574 ath9k: Fix a locking bug in ath9k_add_interface()

-- 
https://patchwork.kernel.org/patch/10650123/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
