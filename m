From: David Miller <davem@davemloft.net>
Date: Thu, 25 Apr 2013 05:48:58 +0000
Subject: Re: [patch] netrom: info leak in ->getname()
Message-Id: <20130425.014858.1706001591492099470.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130423062251.GB15893@elgon.mountain>
In-Reply-To: <20130423062251.GB15893@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Apr 2013 09:22:51 +0300

> The sockaddr_ax25 struct has a 3 byte hole between ->sax25_call and
> ->sax25_ndigis.  I've added a memset to avoid leaking uninitialized
> stack data to userspace.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
