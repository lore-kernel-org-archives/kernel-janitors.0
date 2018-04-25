From: David Miller <davem@davemloft.net>
Date: Wed, 25 Apr 2018 18:12:37 +0000
Subject: Re: [PATCH] net: amd8111e: remove redundant duplicated if statement
Message-Id: <20180425.141237.1661627015961946958.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180425103113.8013-1-colin.king@canonical.com>
In-Reply-To: <20180425103113.8013-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: allen.lkml@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Apr 2018 11:31:13 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> There are two identical nested if statements, the second is redundant
> and can be removed. Also clean up white space formatting.
> 
> Cleans up cppcheck warning:
> drivers/net/ethernet/amd/amd8111e.c:1080: (warning) Identical inner 'if'
> condition is always true.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
