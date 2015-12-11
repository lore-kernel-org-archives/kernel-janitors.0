From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 11 Dec 2015 11:23:20 +0000
Subject: Re: prism54: off by one BUG_ON() test
Message-Id: <20151211112320.5798B141ACB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151204131949.GF12792@mwanda>
References: <20151204131949.GF12792@mwanda>
In-Reply-To: <20151204131949.GF12792@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Luis R. Rodriguez" <mcgrof@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> This code was supposed to trigger a BUG() if we truncate the output but
> it's off by one so it allows one character to be truncated.  Really
> drivers shouldn't call BUG_ON() and especially for something minor like
> this so I've changed it to a WARN_ON().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
