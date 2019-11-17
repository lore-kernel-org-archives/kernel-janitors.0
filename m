From: merez@codeaurora.org
Date: Sun, 17 Nov 2019 08:06:29 +0000
Subject: Re: [PATCH] wil6210: fix break that is never reached because of zero'ing of a retry counter
Message-Id: <0101016e78662264-7ebb46fa-638f-4817-b76a-ed66524d25be-000000@us-west-2.amazonses.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191115120953.48137-1-colin.king@canonical.com>
In-Reply-To: <20191115120953.48137-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2019-11-15 14:09, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a check on the retry counter invalid_buf_id_retry that is 
> always
> false because invalid_buf_id_retry is initialized to zero on each 
> iteration
> of a while-loop.  Fix this by initializing the retry counter before the
> while-loop starts.
> 
> Addresses-Coverity: ("Logically dead code")
> Fixes: b4a967b7d0f5 ("wil6210: reset buff id in status message after
> completion")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> Note: not tested, so I'm not sure if the loop retry threshold is high 
> enough
> 
> ---

Reviewed-by: Maya Erez <merez@codeaurora.org>
