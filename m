From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 16 Aug 2017 17:16:48 +0000
Subject: Re: [PATCH] Revert "staging: fsl-mc: be consistent when checking strcmp() return"
Message-Id: <20170816171647.GA27365@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816171200.31259-1-colin.king@canonical.com>
In-Reply-To: <20170816171200.31259-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 16, 2017 at 06:12:00PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The previous fix removed the equal to zero comparisons by the strcmps and
> now the function always returns true. Revert this change to restore the
> original correctly functioning code.
> 
> Detected by CoverityScan, CID#1452267 ("Constant expression result")
> 
> This reverts commit b93ad9a067e1515af42da7d56bc61f1a25075f94.

So this should say:
Fixes: XXXXXX

right?

And it should get into 4.13-final, right?  Or if not, at least
backported to 4.13-stable?

Can you please resend it with the fixes tag?

thanks,

greg k-h
