From: David Miller <davem@davemloft.net>
Date: Mon, 20 Apr 2020 23:27:22 +0000
Subject: Re: [PATCH] net: ipv4: remove redundant assignment to variable rc
Message-Id: <20200420.162722.800987965200951418.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200420215149.98490-1-colin.king@canonical.com>
In-Reply-To: <20200420215149.98490-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Apr 2020 22:51:49 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is being assigned with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
