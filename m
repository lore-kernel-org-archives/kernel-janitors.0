From: David Miller <davem@davemloft.net>
Date: Fri, 09 Jul 2010 06:43:30 +0000
Subject: Re: [PATCH 2/4] ll_temac: fix memory leak
Message-Id: <20100708.234330.02291854.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278591006-3156-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278591006-3156-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, john.linn@xilinx.com, grant.likely@secretlab.ca, jpirko@redhat.com, brian.hill@xilinx.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu,  8 Jul 2010 16:10:03 +0400

> If of_iomap() or irq_of_parse_and_map() fail then np must be freed.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied, thanks.
