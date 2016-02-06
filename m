From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 06 Feb 2016 12:01:41 +0000
Subject: Re: mwifiex: fix a reversed condition
Message-Id: <20160206120141.65A2B60445@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160202100005.GA3040@mwanda>
References: <20160202100005.GA3040@mwanda>
In-Reply-To: <20160202100005.GA3040@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <akarwar@marvell.com>, chunfan chen <jeffc@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> The NULL test here is reversed.
> 
> Fixes: 7d7f07d8c5d3 ('mwifiex: add wowlan net-detect support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
