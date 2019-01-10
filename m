From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 10 Jan 2019 11:32:59 +0000
Subject: Re: [PATCH] ray_cs: fix array out-of-bounds access
Message-Id: <20190110113300.4CE44608FC@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181220140550.18853-1-colin.king@canonical.com>
In-Reply-To: <20181220140550.18853-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently array element org[3] is being accessed, however the array is
> only 3 elements in size, so this looks like an off-by-one out-of-bounds
> error. Fix this by using org[2], which I believe was the original
> intent.
> 
> This issue has existed in the driver back in the pre-git days, so no
> idea when it was introduced.
> 
> Detected by CoverityScan, CID#711344 ("Out-of-bounds read")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

72255c807156 ray_cs: fix array out-of-bounds access

-- 
https://patchwork.kernel.org/patch/10738943/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
