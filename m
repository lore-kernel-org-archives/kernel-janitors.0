From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 26 Nov 2015 12:05:50 +0000
Subject: Re: ath9k_htc: check for underflow in ath9k_htc_rx_msg()
Message-Id: <20151126120550.4AF5413F351@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151106100120.GB18557@mwanda>
References: <20151106100120.GB18557@mwanda>
In-Reply-To: <20151106100120.GB18557@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org


> We check for overflow here, but we don't check for underflow so it
> causes a static checker warning.
> 
> Fixes: fb9987d0f748 ('ath9k_htc: Support for AR9271 chipset.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
