From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:40:22 +0000
Subject: Re: [PATCH] net: alx: remove redundant variable old_duplex
Message-Id: <20180704.224022.1348748543580883339.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704071530.14431-1-colin.king@canonical.com>
In-Reply-To: <20180704071530.14431-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jcliburn@gmail.com, chris.snook@gmail.com, sd@queasysnail.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 08:15:30 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable old_duplex is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'old_duplex' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
