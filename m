From: David Miller <davem@davemloft.net>
Date: Thu, 01 Feb 2018 19:54:50 +0000
Subject: Re: [PATCH] lan78xx: remove redundant initialization of pointer 'phydev'
Message-Id: <20180201.145450.930634145855259446.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180201171018.22267-1-colin.king@canonical.com>
In-Reply-To: <20180201171018.22267-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  1 Feb 2018 17:10:18 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer phydev is initialized and this value is never read, phydev
> is immediately updated to a new value, hence this initialization
> is redundant and can be removed
> 
> Cleans up clang warning:
> drivers/net/usb/lan78xx.c:2009:21: warning: Value stored to 'phydev'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
