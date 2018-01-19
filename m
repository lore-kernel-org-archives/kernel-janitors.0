From: David Miller <davem@davemloft.net>
Date: Fri, 19 Jan 2018 19:36:51 +0000
Subject: Re: [PATCH][devlink-next] devlink: make functions a couple of new functions static
Message-Id: <20180119.143651.630642000688996110.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180117112303.20149-1-colin.king@canonical.com>
In-Reply-To: <20180117112303.20149-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jan 2018 11:23:03 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The functions devlink_resource_find and devlink_resource_validate_children
> are local to the source and do not need to be in global scope, so make
> them static.
> 
> Cleans up sparse warnings:
> symbol 'devlink_resource_find' was not declared. Should it be static?
> warning: symbol 'devlink_resource_validate_children' was not declared.
> Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
