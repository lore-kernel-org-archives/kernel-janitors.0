From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 25 Nov 2019 12:14:59 +0000
Subject: Re: [PATCH] wil6210: fix break that is never reached because of zero'ing of a retry counter
Message-Id: <0101016ea27c8290-6a36151e-699b-46d6-a206-290403315074-000000@us-west-2.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191115120953.48137-1-colin.king@canonical.com>
In-Reply-To: <20191115120953.48137-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Maya Erez <merez@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> There is a check on the retry counter invalid_buf_id_retry that is always
> false because invalid_buf_id_retry is initialized to zero on each iteration
> of a while-loop.  Fix this by initializing the retry counter before the
> while-loop starts.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: b4a967b7d0f5 ("wil6210: reset buff id in status message after completion")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Maya Erez <merez@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5b1413f00b5b wil6210: fix break that is never reached because of zero'ing of a retry counter

-- 
https://patchwork.kernel.org/patch/11246193/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
