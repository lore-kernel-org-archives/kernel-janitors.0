From: David Miller <davem@davemloft.net>
Date: Thu, 27 Feb 2020 04:52:50 +0000
Subject: Re: [PATCH net-next] net: qrtr: Fix error pointer vs NULL bugs
Message-Id: <20200226.205250.1647452826316197149.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200226145153.a7u2jzhseaipas54@kili.mountain>
In-Reply-To: <20200226145153.a7u2jzhseaipas54@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: manivannan.sadhasivam@linaro.org, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Feb 2020 17:51:53 +0300

> The callers only expect NULL pointers, so returning an error pointer
> will lead to an Oops.
> 
> Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
