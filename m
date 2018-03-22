From: David Miller <davem@davemloft.net>
Date: Thu, 22 Mar 2018 18:53:06 +0000
Subject: Re: [PATCH][next] gre: fix TUNNEL_SEQ bit check on sequence numbering
Message-Id: <20180322.145306.435067580111338677.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180321193458.4451-1-colin.king@canonical.com>
In-Reply-To: <20180321193458.4451-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 21 Mar 2018 19:34:58 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The current logic of flags | TUNNEL_SEQ is always non-zero and hence
> sequence numbers are always incremented no matter the setting of the
> TUNNEL_SEQ bit.  Fix this by using & instead of |.
> 
> Detected by CoverityScan, CID#1466039 ("Operands don't affect result")
> 
> Fixes: 77a5196a804e ("gre: add sequence number for collect md mode.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
