From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Date: Mon, 25 Feb 2019 09:50:45 +0000
Subject: Re: [PATCH] ath9k: remove set but not used variable 'acq'
Message-Id: <87lg24urgq.fsf@toke.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190225033246.127410-1-yuehaibing@huawei.com>
In-Reply-To: <20190225033246.127410-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: YueHaibing <yuehaibing@huawei.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> writes:

> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/net/wireless/ath/ath9k/recv.c: In function 'ath_rx_count_airtime':
> drivers/net/wireless/ath/ath9k/recv.c:1010:18: warning:
>  variable 'acq' set but not used [-Wunused-but-set-variable]
>
> It's not used after 89cea7493a34 ("ath9k: Switch to mac80211 TXQ scheduling
> and airtime APIs"). Also remove related variables.

Ah, right, seems I forgot to clean that up. I wonder why I didn't get a
compiler warning for it. Anyway, nice catch :)

Acked-by: Toke Høiland-Jørgensen <toke@redhat.com>

-Toke
