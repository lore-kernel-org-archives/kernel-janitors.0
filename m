From: David Miller <davem@davemloft.net>
Date: Fri, 10 Aug 2018 17:25:20 +0000
Subject: Re: [PATCH] net: chelsio: cxgb2: remove unused array pci_speed
Message-Id: <20180810.102520.1076878966668982424.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180810080217.26758-1-colin.king@canonical.com>
In-Reply-To: <20180810080217.26758-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Aug 2018 09:02:17 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Array pci_speed is defined but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: 'pci_speed' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
