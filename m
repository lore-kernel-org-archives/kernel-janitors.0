From: David Miller <davem@davemloft.net>
Date: Tue, 09 Jan 2018 16:41:10 +0000
Subject: Re: [PATCH] ipv6: use ARRAY_SIZE for array sizing calculation on array seg6_action_table
Message-Id: <20180109.114110.846074032577787600.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180107235026.8387-1-colin.king@canonical.com>
In-Reply-To: <20180107235026.8387-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun,  7 Jan 2018 23:50:26 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Use the ARRAY_SIZE macro on array seg6_action_table to determine size of
> the array. Improvement suggested by coccinelle.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
