From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 31 Aug 2020 15:16:52 +0000
Subject: Re: [PATCH][next] ath11k: fix missing error check on call to ath11k_pci_get_user_msi_assignment
Message-Id: <20200831151652.4D014C43395@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200819111452.52419-1-colin.king@canonical.com>
In-Reply-To: <20200819111452.52419-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> The return error check on the call to ath11k_pci_get_user_msi_assignment is
> missing.  If an error does occur, num_vectors is still set to zero and
> later on a division by zero can occur when variable vector is being
> calculated.  Fix this by adding an error check after the call.
> 
> Addresses-Coverity: ("Division or modulo by zero")
> Fixes: d4ecb90b3857 ("ath11k: enable DP interrupt setup for QCA6390")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

b2c094582e38 ath11k: fix missing error check on call to ath11k_pci_get_user_msi_assignment

-- 
https://patchwork.kernel.org/patch/11723523/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
