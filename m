From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 11 Dec 2015 11:22:32 +0000
Subject: Re: hostap: fix an error code in prism2_config()
Message-Id: <20151211112232.34708141AC6@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151204131746.GE12792@mwanda>
References: <20151204131746.GE12792@mwanda>
In-Reply-To: <20151204131746.GE12792@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jouni Malinen <j@w1.fi>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> The current code returns success if prism2_init_local_data() fails, but
> we want to return an error code.  Also we can remove the bogus
> ret initializer because it is wrong and never used.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
