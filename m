From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 13 Aug 2015 12:33:48 +0000
Subject: Re: mwifiex: usb: return an error if kmalloc fails
Message-Id: <20150813123348.1770414063C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150804074927.GD10867@mwanda>
References: <20150804074927.GD10867@mwanda>
In-Reply-To: <20150804074927.GD10867@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <akarwar@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> The current code returns success if kmalloc fails.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Amitkumar Karwar <akarwar@marvell.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
