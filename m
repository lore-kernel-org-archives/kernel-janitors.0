From: David Miller <davem@davemloft.net>
Date: Thu, 04 Jul 2019 19:12:30 +0000
Subject: Re: [PATCH] net: ethernet: sun: remove redundant assignment to variable err
Message-Id: <20190704.121230.1258734619521898253.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190704123651.31672-1-colin.king@canonical.com>
In-Reply-To: <20190704123651.31672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  4 Jul 2019 13:36:51 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being assigned with a value that is never
> read and it is being updated in the next statement with a new value.
> The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
