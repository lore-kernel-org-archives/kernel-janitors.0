From: David Miller <davem@davemloft.net>
Date: Tue, 28 Nov 2017 21:01:10 +0000
Subject: Re: [PATCH] atm: fore200e: use %pK to format kernel addresses instead of %x
Message-Id: <20171128.160110.117717033696666746.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171127132415.10753-1-colin.king@canonical.com>
In-Reply-To: <20171127132415.10753-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Nov 2017 13:24:15 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't use %x and casting to print out a kernel address, instead use the
> %pK and remove the casting.  Cleans up smatch warning:
> 
> drivers/atm/fore200e.c:3093 fore200e_proc_read() warn: argument 3 to %08x
> specifier is cast from pointer
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
