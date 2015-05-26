From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 26 May 2015 10:55:27 +0000
Subject: Re: rndis_wlan: harmless issue calling set_bit()
Message-Id: <20150526105527.B1B371416EC@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150514083750.GD1665@mwanda>
References: <20150514083750.GD1665@mwanda>
In-Reply-To: <20150514083750.GD1665@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Joe Perches <joe@perches.com>


> These are used like:
> 
> 	set_bit(WORK_LINK_UP, &priv->work_pending);
> 
> The problem is that set_bit() takes the actual bit number and not a mask
> so static checkers get upset.  It doesn't affect run time because we do
> it consistently, but we may as well clean it up.
> 
> Fixes: 6010ce07a66c ('rndis_wlan: do link-down state change in worker thread')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
