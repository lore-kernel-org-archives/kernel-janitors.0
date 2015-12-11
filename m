From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 11 Dec 2015 11:15:31 +0000
Subject: Re: cw1200: remove some dead code
Message-Id: <20151211111531.630D3141A67@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151204131523.GB12792@mwanda>
References: <20151204131523.GB12792@mwanda>
In-Reply-To: <20151204131523.GB12792@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Solomon Peachy <pizza@shaftnet.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> If the mode is NL80211_IFTYPE_UNSPECIFIED then we return success at the
> start of the function so this condition is never true.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
