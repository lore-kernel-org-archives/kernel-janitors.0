From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 15 Nov 2018 09:33:14 +0000
Subject: Re: [PATCH][next] reset: fix null pointer dereference on dev by dev_name
Message-Id: <1542274394.4915.6.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181114214935.16038-1-colin.king@canonical.com>
In-Reply-To: <20181114214935.16038-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Wed, 2018-11-14 at 21:49 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to dev_name will dereference dev, however, dev is later
> being null checked, so there is a possibility of a null pointer
> dereference on dev by the call to dev_name. Fix this by null
> checking dev first before the call to dev_name
> 
> Detected by CoverityScan, CID#1475475 ("Dereference before null check")
> 
> Fixes: 2a6cb2b1d83b ("reset: Add reset_control_get_count()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thank you, applied to reset/next.

regards
Philipp
