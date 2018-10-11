From: David Miller <davem@davemloft.net>
Date: Thu, 11 Oct 2018 05:18:40 +0000
Subject: Re: [PATCH] net: aquantia: remove some redundant variable initializations
Message-Id: <20181010.221840.945121881022811735.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181008133558.5841-1-colin.king@canonical.com>
In-Reply-To: <20181008133558.5841-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: igor.russkikh@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon,  8 Oct 2018 14:35:58 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> There are several variables being initialized that are being set later
> and hence the initialization is redundant and can be removed. Remove
> then.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
