From: David Miller <davem@davemloft.net>
Date: Sun, 01 Sep 2019 18:45:22 +0000
Subject: Re: [PATCH] netlabel: remove redundant assignment to pointer iter
Message-Id: <20190901.114522.824322370364603821.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190901155205.16877-1-colin.king@canonical.com>
In-Reply-To: <20190901155205.16877-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: paul@paul-moore.com, netdev@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun,  1 Sep 2019 16:52:05 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer iter is being initialized with a value that is never read and
> is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
