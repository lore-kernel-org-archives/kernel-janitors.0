From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 30 Nov 2015 12:58:30 +0000
Subject: Re: libertas: cleanup a variable name
Message-Id: <20151130125830.29FEA1409D5@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151126120449.GK10556@mwanda>
References: <20151126120449.GK10556@mwanda>
In-Reply-To: <20151126120449.GK10556@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> "&card->priv->driver_lock" and "&priv->driver_lock" are the same and
> it's nicer to use the shorter one consistently.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
