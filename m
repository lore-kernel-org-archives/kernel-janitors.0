From: David Miller <davem@davemloft.net>
Date: Wed, 23 Mar 2011 21:10:59 +0000
Subject: Re: [PATCH 3/3] drivers/net/a2065.c: Convert release_resource to
Message-Id: <20110323.141059.27811716.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1300814123-25314-3-git-send-email-julia@diku.dk>
In-Reply-To: <1300814123-25314-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: kernel-janitors@vger.kernel.org, eric.dumazet@gmail.com, tj@kernel.org, jpirko@redhat.com, geert@linux-m68k.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Mar 2011 18:15:23 +0100

> Request_mem_region should be used with release_mem_region, not
> release_resource.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
