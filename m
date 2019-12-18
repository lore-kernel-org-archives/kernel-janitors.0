From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 18:51:54 +0000
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
Message-Id: <20191218185154.B16F6C447A3@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
In-Reply-To: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Roy Luo <royluo@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The sband->bitrates[] array has "sband->n_bitrates" elements so this
> check needs to be >= instead of > or we could read beyond the end of the
> array.
> 
> These values come from when we call mt76_register_device():
> 
> 	ret = mt76_register_device(&dev->mt76, true, mt7603_rates,
> 				   ARRAY_SIZE(mt7603_rates));
> 
> Here sband->bitrates[] is mt7603_rates[] and ->n_bitrates is the
> ARRAY_SIZE()
> 
> Fixes: 5ce09c1a7907 ("mt76: track rx airtime for airtime fairness and survey")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers.git, thanks.

b43e36d75e87 mt76: Off by one in mt76_calc_rx_airtime()

-- 
https://patchwork.kernel.org/patch/11261391/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
