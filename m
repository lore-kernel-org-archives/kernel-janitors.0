From: David Miller <davem@davemloft.net>
Date: Mon, 02 Aug 2010 23:08:55 +0000
Subject: Re: [patch] hp100: unmap memory on error path
Message-Id: <20100802.160855.214222892.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100730090604.GY26313@bicker>
In-Reply-To: <20100730090604.GY26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: perex@perex.cz, jpirko@redhat.com, shemminger@vyatta.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Fri, 30 Jul 2010 11:06:04 +0200

> There was an error path where "mem_ptr_virt" didn't get unmapped.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thanks Dan.
