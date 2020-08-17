From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 17 Aug 2020 10:24:14 +0000
Subject: Re: [PATCH] ath9k: Fix potential out of bounds in ath9k_htc_txcompletion_cb()
Message-Id: <20200817102414.F1F20C43387@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200813141253.GA457408@mwanda>
In-Reply-To: <20200813141253.GA457408@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Jakub Kicinski <kuba@kernel.org>, Vasanthakumar Thiagarajan <vasanth@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Senthil Balasubramanian <senthilkumar@atheros.com>, Sujith <Sujith.Manoharan@atheros.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The value of "htc_hdr->endpoint_id" comes from skb->data so Smatch marks
> it as untrusted so we have to check it before using it as an array
> offset.
> 
> This is similar to a bug that syzkaller found in commit e4ff08a4d727
> ("ath9k: Fix use-after-free Write in ath9k_htc_rx_msg") so it is
> probably a real issue.
> 
> Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

2705cd7558e7 ath9k: Fix potential out of bounds in ath9k_htc_txcompletion_cb()

-- 
https://patchwork.kernel.org/patch/11712553/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
