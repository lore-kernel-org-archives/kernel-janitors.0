From: David Miller <davem@davemloft.net>
Date: Thu, 23 Jul 2020 00:55:49 +0000
Subject: Re: [PATCH][next] lan743x: remove redundant initialization of variable current_head_index
Message-Id: <20200722.175549.1334326051003988959.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722151221.957972-1-colin.king@canonical.com>
In-Reply-To: <20200722151221.957972-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jul 2020 16:12:21 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable current_head_index is being initialized with a value that
> is never read and it is being updated later with a new value.  Replace
> the initialization of -1 with the latter assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
