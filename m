From: Amitkumar Karwar <akarwar@marvell.com>
Date: Mon, 23 Mar 2015 11:28:44 +0000
Subject: RE: [patch] mwifiex: remove an unneede NULL check in mwifiex_init_adapter()
Message-Id: <5FF020A1CFFEEC49BD1E09530C4FF5951B16B5ECA2@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150323093551.GC558@mwanda>
In-Reply-To: <20150323093551.GC558@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Avinash Patil <patila@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

Thanks for the patch.

> Subject: [patch] mwifiex: remove an unneede NULL check in
> mwifiex_init_adapter()
> 
> "adapter->sleep_cfm" is always non-NULL at this point.  Static checkers
> complain that we already dereference it at the start of the function
> when we do:
> 
> 	skb_put(adapter->sleep_cfm, sizeof(struct
> mwifiex_opt_sleep_confirm));
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Acked-by: Amitkumar Karwar <akarwar@marvell.com>

Regards,
Amit
