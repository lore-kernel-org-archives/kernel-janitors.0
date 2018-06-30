From: David Miller <davem@davemloft.net>
Date: Sat, 30 Jun 2018 09:45:31 +0000
Subject: Re: [PATCH net] atm: iphase: fix a 64 bit bug
Message-Id: <20180630.184531.515145050835343609.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180628092442.uu4ktcqymi65hbuh@kili.mountain>
In-Reply-To: <20180628092442.uu4ktcqymi65hbuh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: 3chas3@gmail.com, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jun 2018 12:24:42 +0300

> The code assumes that there is 4 bytes in a pointer and it doesn't
> allocate enough memory.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
