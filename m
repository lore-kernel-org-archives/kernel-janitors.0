From: David Miller <davem@davemloft.net>
Date: Tue, 24 Apr 2018 20:01:11 +0000
Subject: Re: [PATCH] fsl/fman_port: remove redundant check on port->rev_info.major
Message-Id: <20180424.160111.115150071933075757.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424113945.16371-1-colin.king@canonical.com>
In-Reply-To: <20180424113945.16371-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: madalin.bucur@nxp.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 24 Apr 2018 12:39:45 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The check port->rev_info.major >= 6 is being performed twice, thus
> the inner second check is always true and is redundant, hence it
> can be removed. Detected by cppcheck.
> 
> drivers/net/ethernet/freescale/fman/fman_port.c:1394]: (warning)
> Identical inner 'if' condition is always true.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thank you.
