From: David Miller <davem@davemloft.net>
Date: Wed, 06 Feb 2019 19:52:41 +0000
Subject: Re: [PATCH] net: sxgbe: fix unintended sign extension
Message-Id: <20190206.115241.1549120165262106425.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190206102503.16929-1-colin.king@canonical.com>
In-Reply-To: <20190206102503.16929-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: bh74.an@samsung.com, ks.giri@samsung.com, vipul.pandya@samsung.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  6 Feb 2019 10:25:03 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting a u8 by 24 will cause the value to be promoted to an integer. If
> the top bit of the u8 is set then the following conversion to an unsigned
> long will sign extend the value causing the upper 32 bits to be set in
> the result.

We feed this into a writel() which truncates to a 32-bit value, so nothing
bad can happen here.

This is a very canonical way to code up something like this, it works
properly in all situations, and therefore I'd rather not add all of
these fat ugly looking casts.

Thank you.
