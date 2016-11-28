From: David Miller <davem@davemloft.net>
Date: Mon, 28 Nov 2016 01:30:25 +0000
Subject: Re: [patch v2 net-next] sfc: remove unneeded variable
Message-Id: <20161127.203025.1356720731286532574.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <698affdd-d4e0-53c0-fff0-9b66252504a0@solarflare.com>
        <20161125104304.GA5938@mwanda>
In-Reply-To: <20161125104304.GA5938@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Nov 2016 13:43:04 +0300

> We don't use ->heap_buf after commit 46d1efd852cc ("sfc: remove Software
> TSO") so let's remove the last traces.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
