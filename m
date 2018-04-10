From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 10 Apr 2018 14:30:03 +0000
Subject: Re: [next] wil6210: fix potential null dereference of ndev before null check
Message-Id: <20180410143003.A40E460AFB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328174027.31551-1-colin.king@canonical.com>
In-Reply-To: <20180328174027.31551-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Maya Erez <merez@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> The pointer ndev is being dereferenced before it is being null checked,
> hence there is a potential null pointer deference. Fix this by only
> dereferencing ndev after it has been null checked
> 
> Detected by CoverityScan, CID#1467010 ("Dereference before null check")
> 
> Fixes: e00243fab84b ("wil6210: infrastructure for multiple virtual interfaces")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Maya Erez <merez@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

db5a4d5e1073 wil6210: fix potential null dereference of ndev before null check

-- 
https://patchwork.kernel.org/patch/10313705/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

