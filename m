From: Kalle Valo <kvalo@codeaurora.org>
Date: Sun, 26 Jan 2020 10:48:34 +0000
Subject: Re: [PATCH][next] ath11k: avoid null pointer dereference when pointer band is null
Message-Id: <20200126104834.26455C4479C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200111090824.9999-1-colin.king@canonical.com>
In-Reply-To: <20200111090824.9999-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, John Crispin <john@phrozen.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> In the unlikely event that cap->supported_bands has neither
> WMI_HOST_WLAN_2G_CAP set or WMI_HOST_WLAN_5G_CAP set then pointer
> band is null and a null dereference occurs when assigning
> band->n_iftype_data.  Move the assignment to the if blocks to
> avoid this.  Cleans up static analysis warnings.
> 
> Addresses-Coverity: ("Explicit null dereference")
> Fixes: 9f056ed8ee01 ("ath11k: add HE support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3b4516838eaa ath11k: avoid null pointer dereference when pointer band is null

-- 
https://patchwork.kernel.org/patch/11328755/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
