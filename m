From: David Miller <davem@davemloft.net>
Date: Mon, 27 May 2019 05:12:18 +0000
Subject: Re: [PATCH][next] ipv4: remove redundant assignment to n
Message-Id: <20190526.221218.594997463672055463.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190524215658.25432-1-colin.king@canonical.com>
In-Reply-To: <20190524215658.25432-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 24 May 2019 22:56:58 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer n is being assigned a value however this value is
> never read in the code block and the end of the code block
> continues to the next loop iteration. Clean up the code by
> removing the redundant assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
