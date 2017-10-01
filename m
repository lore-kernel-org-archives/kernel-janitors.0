From: David Miller <davem@davemloft.net>
Date: Sun, 01 Oct 2017 03:07:21 +0000
Subject: Re: [PATCH][net-next] net: ipmr: make function ipmr_notifier_init static
Message-Id: <20171001.040721.1898715383953902696.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170929133422.7846-1-colin.king@canonical.com>
In-Reply-To: <20170929133422.7846-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Sep 2017 14:34:22 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function ipmr_notifier_init is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> warning: symbol 'ipmr_notifier_init' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
