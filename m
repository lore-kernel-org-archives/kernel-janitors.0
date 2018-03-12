From: David Miller <davem@davemloft.net>
Date: Mon, 12 Mar 2018 15:13:02 +0000
Subject: Re: [PATCH][next] lan743x: make functions lan743x_csr_read and lan743x_csr_read static
Message-Id: <20180312.111302.544568010784710629.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180311165547.27500-1-colin.king@canonical.com>
In-Reply-To: <20180311165547.27500-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun, 11 Mar 2018 17:55:47 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Functions lan743x_csr_read and lan743x_csr_read are local to the source
> and do not need to be in global scope, so make them static.
> 
> Cleans up sparse warning:
> drivers/net/ethernet/microchip/lan743x_main.c:56:5: warning: symbol
> lan743x_csr_read' was not declared. Should it be static?
> drivers/net/ethernet/microchip/lan743x_main.c:61:6: warning: symbol
> 'lan743x_csr_write' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
