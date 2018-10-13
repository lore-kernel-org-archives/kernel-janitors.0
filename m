From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 13 Oct 2018 12:01:00 +0000
Subject: Re: [PATCH] rtlwifi: rtl8821ae: replace _rtl8821ae_mrate_idx_to_arfr_id with generic version
Message-Id: <20181013120100.A423160866@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181008085028.23874-1-colin.king@canonical.com>
In-Reply-To: <20181008085028.23874-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, "David S . Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Function _rtl8821ae_mrate_idx_to_arfr_id is functionally identical to
> the generic version rtl_mrate_idx_to_arfr_id, so remove 
> _rtl8821ae_mrate_idx_to_arfr_id and use the generic one instead.
> 
> This also fixes a missing break statement found by CoverityScan in
> _rtl8821ae_mrate_idx_to_arfr_id, namely: CID#1167237 ("Missing break
> in switch")
> 
> Thanks to Joe Perches for spotting this when I submitted an earlier patch.
> 
> Fixes: 3c05bedb5fef ("Staging: rtl8812ae: Add Realtek 8821 PCI WIFI driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ACKed-by: Larry Finger <Larry.Finger@lwfinger.net>

Patch applied to wireless-drivers-next.git, thanks.

c894696188d5 rtlwifi: rtl8821ae: replace _rtl8821ae_mrate_idx_to_arfr_id with generic version

-- 
https://patchwork.kernel.org/patch/10630249/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
