From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 03 Sep 2019 13:44:19 +0000
Subject: Re: [PATCH][V2] bcma: fix incorrect update of BCMA_CORE_PCI_MDIO_DATA
Message-Id: <20190903134420.6A8D9608FF@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827081620.20998-1-colin.king@canonical.com>
In-Reply-To: <20190827081620.20998-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> An earlier commit re-worked the setting of the bitmask and is now
> assigning v with some bit flags rather than bitwise or-ing them
> into v, consequently the earlier bit-settings of v are being lost.
> Fix this by replacing an assignment with the bitwise or instead.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 2be25cac8402 ("bcma: add constants for PCI and use them")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

420c20be08a4 bcma: fix incorrect update of BCMA_CORE_PCI_MDIO_DATA

-- 
https://patchwork.kernel.org/patch/11116317/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
