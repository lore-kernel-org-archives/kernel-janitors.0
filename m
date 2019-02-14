From: Steve deRosier <derosier@gmail.com>
Date: Thu, 14 Feb 2019 15:58:07 +0000
Subject: Re: [PATCH] libertas_tf: remove set but not used variable 'flags'
Message-Id: <CALLGbRLa75S_ugu-JwXiUu2rtN-a4DX_Kta2viteEQDTW3ATMw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213014917.164506-1-yuehaibing@huawei.com>
In-Reply-To: <20190213014917.164506-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, Colin Ian King <colin.king@canonical.com>, linux-wireless <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org, Network Development <netdev@vger.kernel.org>

On Tue, Feb 12, 2019 at 5:35 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/net/wireless/marvell/libertas_tf/main.c: In function 'lbtf_rx':
> drivers/net/wireless/marvell/libertas_tf/main.c:554:15: warning:
>  variable 'flags' set but not used [-Wunused-but-set-variable]
>
> It never used and can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Steve deRosier <derosier@cal-sierra.com>
