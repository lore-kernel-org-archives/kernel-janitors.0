From: David Miller <davem@davemloft.net>
Date: Mon, 12 Mar 2018 15:12:51 +0000
Subject: Re: [PATCH][rds-next] rds: remove redundant variable 'sg_off'
Message-Id: <20180312.111251.956883878311919021.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180311162756.26950-1-colin.king@canonical.com>
In-Reply-To: <20180311162756.26950-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: santosh.shilimkar@oracle.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun, 11 Mar 2018 17:27:56 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable sg_off is assigned a value but it is never read, hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> net/rds/message.c:373:2: warning: Value stored to 'sg_off' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
