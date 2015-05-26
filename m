From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 26 May 2015 10:54:44 +0000
Subject: Re: ath9k_htc: memory corruption calling set_bit()
Message-Id: <20150526105444.2FAC81416CE@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150514083448.GC1665@mwanda>
References: <20150514083448.GC1665@mwanda>
In-Reply-To: <20150514083448.GC1665@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Sujith Manoharan <c_manoha@qca.qualcomm.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>


> In d8a2c51cdcae ('ath9k_htc: Use atomic operations for op_flags') we
> changed things like this:
> 
> -	if (priv->op_flags & OP_TSF_RESET) {
> +	if (test_bit(OP_TSF_RESET, &priv->op_flags)) {
> 
> The problem is that test_bit() takes a bit number and not a mask.  It
> means that when we do:
> 
> 	set_bit(OP_TSF_RESET, &priv->op_flags);
> 
> Then it sets the (1 << 6) bit instead of the 6 bit so we are setting a
> bit which is past the end of the unsigned long.
> 
> Fixes: d8a2c51cdcae ('ath9k_htc: Use atomic operations for op_flags')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
