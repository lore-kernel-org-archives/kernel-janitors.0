From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 30 Mar 2015 08:34:07 +0000
Subject: Re: mwifiex: remove an unneede NULL check in mwifiex_init_adapter()
Message-Id: <20150330083407.C034F140243@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150323093551.GC558@mwanda>
References: <20150323093551.GC558@mwanda>
In-Reply-To: <20150323093551.GC558@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <akarwar@marvell.com>, Avinash Patil <patila@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> "adapter->sleep_cfm" is always non-NULL at this point.  Static checkers
> complain that we already dereference it at the start of the function
> when we do:
> 
> 	skb_put(adapter->sleep_cfm, sizeof(struct mwifiex_opt_sleep_confirm));
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Amitkumar Karwar <akarwar@marvell.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
