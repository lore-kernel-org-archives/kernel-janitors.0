From: David Miller <davem@davemloft.net>
Date: Wed, 01 Nov 2017 12:24:16 +0000
Subject: Re: [PATCH] net: hso: remove redundant unused variable dev
Message-Id: <20171101.212416.1255930983444370494.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171031120147.22348-1-colin.king@canonical.com>
In-Reply-To: <20171031120147.22348-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: johan@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Oct 2017 12:01:47 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer dev is being assigned but is never used, hence it is
> redundant and can be removed. Cleans up clang warning:
> 
> drivers/net/usb/hso.c:2280:2: warning: Value stored to 'dev' is
> never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
