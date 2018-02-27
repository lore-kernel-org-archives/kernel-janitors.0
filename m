From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 27 Feb 2018 16:46:14 +0000
Subject: Re: ath5k: remove duplicated re-assignment to pointer 'tq'
Message-Id: <20180227164614.323FE60285@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180201180327.23435-1-colin.king@canonical.com>
In-Reply-To: <20180201180327.23435-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, "Luis R . Rodriguez" <mcgrof@do-not-panic.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> Pointer tq is initialized with &ah->ah_txq[queue] and then a few
> lines later is re-assigned the same value, hence this duplicate
> assignment is redundant and can be removed.
> 
> Cleans up clang warning:
> drivers/net/wireless/ath/ath5k/qcu.c:326:25: warning: Value stored
> to 'tq' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2571c081cb43 ath5k: remove duplicated re-assignment to pointer 'tq'

-- 
https://patchwork.kernel.org/patch/10195805/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

