From: David Miller <davem@davemloft.net>
Date: Tue, 30 Jun 2020 20:37:12 +0000
Subject: Re: [PATCH][next] net/tls: fix sign extension issue when left shifting u16 value
Message-Id: <20200630.133712.641790280086952744.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200630142746.516188-1-colin.king@canonical.com>
In-Reply-To: <20200630142746.516188-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: borisp@mellanox.com, aviadye@mellanox.com, john.fastabend@gmail.com, daniel@iogearbox.net, kuba@kernel.org, tariqt@mellanox.com, saeedm@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Jun 2020 15:27:46 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Left shifting the u16 value promotes it to a int and then it
> gets sign extended to a u64.  If len << 16 is greater than 0x7fffffff
> then the upper bits get set to 1 because of the implicit sign extension.
> Fix this by casting len to u64 before shifting it.
> 
> Addresses-Coverity: ("integer handling issues")
> Fixes: ed9b7646b06a ("net/tls: Add asynchronous resync")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
