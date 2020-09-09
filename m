From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 09 Sep 2020 06:49:36 +0000
Subject: Re: [PATCH net-next] ath11k: fix uninitialized return in ath11k_spectral_process_data()
Message-Id: <0101017471a07992-e553dd64-fb73-44d0-bd54-ee6367163e50-000000@us-west-2.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200619142922.GA267142@mwanda>
In-Reply-To: <20200619142922.GA267142@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Karthikeyan Periyasamy <periyasa@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a success path where "ret" isn't initialized where we never
> have a ATH11K_SPECTRAL_TAG_SCAN_SEARCH and then ret isn't initialized.
> 
> Fixes: 9d11b7bff950 ("ath11k: add support for spectral scan")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c7187acc3cd0 ath11k: fix uninitialized return in ath11k_spectral_process_data()

-- 
https://patchwork.kernel.org/patch/11614313/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
