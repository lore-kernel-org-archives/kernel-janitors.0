From: David Miller <davem@davemloft.net>
Date: Tue, 23 Mar 2010 01:33:39 +0000
Subject: Re: [patch] korina: use resource_size()
Message-Id: <20100322.183339.228963639.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322121145.GK21571@bicker>
In-Reply-To: <20100322121145.GK21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, n0-1@freewrt.org, jpirko@redhat.com, shemminger@vyatta.com, joe@perches.com

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 15:11:45 +0300

> This size calculation is wrong.  It should be end - start + 1.
> Use resource_size() to calculate it correctly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
