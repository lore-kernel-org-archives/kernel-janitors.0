From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 04 Apr 2019 14:33:28 +0000
Subject: Re: [PATCH] ath6kl: remove redundant check of status != 0
Message-Id: <87sguxsuvb.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404134723.24667-1-colin.king@canonical.com>
In-Reply-To: <20190404134723.24667-1-colin.king@canonical.com> (Colin King's
        message of "Thu, 4 Apr 2019 14:47:23 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The check on status not being zero is redundant as previous code
> paths that set status to an error value break out of the while
> loop and hence status is never non-zero at the check. Remove
> this redundant code.
>
> Addresses-Coverity: ("Logically dead code")

Is the coverity id missing?

-- 
Kalle Valo
