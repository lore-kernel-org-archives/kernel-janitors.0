From: David Miller <davem@davemloft.net>
Date: Thu, 18 May 2017 15:24:51 +0000
Subject: Re: [PATCH] liquidio: make the spinlock octeon_devices_lock static
Message-Id: <20170518.112451.1077297322113539139.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170518091401.13013-1-colin.king@canonical.com>
In-Reply-To: <20170518091401.13013-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: derek.chickles@caviumnetworks.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 18 May 2017 10:14:01 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> octeon_devices_lock can be made static as it does not need to be
> in global scope.
> 
> Cleans up sparse warning: "warning: symbol 'octeon_devices_lock'
> was not declared. Should it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
