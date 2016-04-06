From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 06 Apr 2016 18:27:40 +0000
Subject: Re: brcmfmac: uninitialized "ret" variable
Message-Id: <20160406182740.2065C61608@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160315070610.GC13560@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Hante Meuleman <meuleman@broadcom.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, "Fu, Zhonghui" <zhonghui.fu@linux.intel.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list@broadcom.com, kernel-janitors@vger.kernel.org


> There is an error path where "ret" isn't initialized.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
