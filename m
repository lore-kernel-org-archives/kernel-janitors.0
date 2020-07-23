From: David Miller <davem@davemloft.net>
Date: Thu, 23 Jul 2020 01:10:43 +0000
Subject: Re: [PATCH][next] ionic: fix memory leak of object 'lid'
Message-Id: <20200722.181043.1052337587227758653.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200722174003.962374-1-colin.king@canonical.com>
In-Reply-To: <20200722174003.962374-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: snelson@pensando.io, drivers@pensando.io, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jul 2020 18:40:03 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when netdev fails to allocate the error return path
> fails to free the allocated object 'lid'.  Fix this by setting
> err to the return error code and jumping to a new label that
> performs the kfree of lid before returning.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: 4b03b27349c0 ("ionic: get MTU from lif identity")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
