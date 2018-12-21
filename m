From: David Miller <davem@davemloft.net>
Date: Fri, 21 Dec 2018 00:41:13 +0000
Subject: Re: [PATCH][next] neighbour: remove stray semicolon
Message-Id: <20181220.164113.1954199771405222572.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181220165050.17429-1-colin.king@canonical.com>
In-Reply-To: <20181220165050.17429-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: dsahern@gmail.com, roopa@cumulusnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Dec 2018 16:50:50 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the stray semicolon means that the final term in the addition
> is being missed.  Fix this by removing it. Cleans up clang warning:
> 
> net/core/neighbour.c:2821:9: warning: expression result unused [-Wunused-value]
> 
> Fixes: 82cbb5c631a0 ("neighbour: register rtnl doit handler")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
