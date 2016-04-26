From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 26 Apr 2016 09:29:22 +0000
Subject: Re: [1/2] mwifiex: missing error code on allocation failure
Message-Id: <20160426092922.97867612EC@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160419142158.GA4876@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <akarwar@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> We accidentally return success instead of -ENOMEM.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, 2 patches applied to wireless-drivers-next.git:

e0bdef0f75f0 mwifiex: missing error code on allocation failure
394f0ed53108 mwifiex: fix loop timeout in mwifiex_prog_fw_w_helper()

Kalle Valo
