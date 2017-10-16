From: David Miller <davem@davemloft.net>
Date: Mon, 16 Oct 2017 20:25:00 +0000
Subject: Re: [PATCH] tcp: cdg: make struct tcp_cdg static
Message-Id: <20171016.212500.1664833771375901207.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171016133321.15477-1-colin.king@canonical.com>
In-Reply-To: <20171016133321.15477-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Oct 2017 14:33:21 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure tcp_cdg is local to the source and
> does not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'tcp_cdg' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
