From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Date: Mon, 12 Mar 2018 06:54:27 +0000
Subject: Re: [PATCH][rds-next] rds: remove redundant variable 'sg_off'
Message-Id: <cd3c782b-0d54-21e5-43e7-f2120bfb6348@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180311162756.26950-1-colin.king@canonical.com>
In-Reply-To: <20180311162756.26950-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/11/18 9:27 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable sg_off is assigned a value but it is never read, hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> net/rds/message.c:373:2: warning: Value stored to 'sg_off' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   net/rds/message.c | 2 --
>   1 file changed, 2 deletions(-)
> 
Thanks Colin !!

Acked-by: Santosh Shilimkar <santosh.shilimkar@oracle.com>
