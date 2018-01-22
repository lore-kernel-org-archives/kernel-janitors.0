From: David Miller <davem@davemloft.net>
Date: Mon, 22 Jan 2018 14:27:37 +0000
Subject: Re: [PATCH][next] devlink: fix memory leak on 'resource'
Message-Id: <20180122.092737.278179232055886032.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180122103119.4801-1-colin.king@canonical.com>
In-Reply-To: <20180122103119.4801-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: arkadis@mellanox.com, jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jan 2018 10:31:19 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently, if the call to devlink_resource_find returns null then
> the error exit path does not free the devlink_resource 'resource'
> and a memory leak occurs. Fix this by kfree'ing resource on the
> error exit path.
> 
> Detected by CoverityScan, CID#1464184 ("Resource leak")
> 
> Fixes: d9f9b9a4d05f ("devlink: Add support for resource abstraction")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
