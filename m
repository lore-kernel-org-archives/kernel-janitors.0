From: David Miller <davem@davemloft.net>
Date: Tue, 28 Nov 2017 21:03:39 +0000
Subject: Re: [PATCH] atm: lanai: use %p to format kernel addresses instead of %x
Message-Id: <20171128.160339.37744043841577511.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171127133932.11207-1-colin.king@canonical.com>
In-Reply-To: <20171127133932.11207-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Nov 2017 13:39:32 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't use %x and casting to print out a kernel address, instead use %p
> and remove the casting.  Cleans up smatch warnings:
> 
> drivers/atm/lanai.c:1589 service_buffer_allocate() warn: argument 2 to
> %08lX specifier is cast from pointer
> drivers/atm/lanai.c:2221 lanai_dev_open() warn: argument 4 to %lx
> specifier is cast from pointer
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
