From: David Miller <davem@davemloft.net>
Date: Fri, 06 Sep 2019 14:47:52 +0000
Subject: Re: [PATCH] lan743x: remove redundant assignment to variable rx_process_result
Message-Id: <20190906.164752.2021789297971211632.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905140135.26951-1-colin.king@canonical.com>
In-Reply-To: <20190905140135.26951-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  5 Sep 2019 15:01:35 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rx_process_result is being initialized with a value that
> is never read and is being re-assigned immediately afterwards. The
> assignment is redundant, so replace it with the return from function
> lan743x_rx_process_packet.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
