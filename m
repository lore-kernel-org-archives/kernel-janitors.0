From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 16 Jan 2018 14:34:24 +0000
Subject: Re: ath10k: remove redundant -ve check against u32 integer size
Message-Id: <20180116143424.26848602BA@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180112172713.28252-1-colin.king@canonical.com>
In-Reply-To: <20180112172713.28252-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> Variable section_table.size is a u32 and so cannot be less than
> zero, hence the less than zero check is redundant and can be
> removed.
> 
> Detected by CoverityScan, CID#1463855 ("Unsigned compared against 0")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

95f27a51ee02 ath10k: remove redundant -ve check against u32 integer size

-- 
https://patchwork.kernel.org/patch/10161483/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

