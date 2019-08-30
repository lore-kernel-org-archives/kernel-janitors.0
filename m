From: David Miller <davem@davemloft.net>
Date: Fri, 30 Aug 2019 19:32:31 +0000
Subject: Re: [PATCH][V2] wimax/i2400m: remove debug containing bogus calculation of index
Message-Id: <20190830.123231.792067088434189707.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190830090711.15300-1-colin.king@canonical.com>
In-Reply-To: <20190830090711.15300-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: inaky.perez-gonzalez@intel.com, linux-wimax@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Aug 2019 10:07:11 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The subtraction of the two pointers is automatically scaled by the
> size of the size of the object the pointers point to, so the division
> by sizeof(*i2400m->barker) is incorrect.  This has been broken since
> day one of the driver and is only debug, so remove the debug completely.
> 
> Also move && in condition to clean up a checkpatch warning.
> 
> Addresses-Coverity: ("Extra sizeof expression")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: completely remove debug, clean up checkpatch warning, change subject line

Applied to net-next, thanks Colin.
