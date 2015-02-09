From: David Miller <davem@redhat.com>
Date: Mon, 09 Feb 2015 22:10:18 +0000
Subject: Re: [PATCH v2] net: Mellanox: Delete unnecessary checks before the function call "vunmap"
Message-Id: <20150209.141018.2220346219639672419.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54D22B29.3020200@users.sourceforge.net>
	<20150205.003404.261962007607296519.davem@davemloft.net>
	<54D88A26.2060307@users.sourceforge.net>
In-Reply-To: <54D88A26.2060307@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: elfring@users.sourceforge.net
Cc: eli@mellanox.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, julia.lawall@lip6.fr

From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 09 Feb 2015 11:21:26 +0100

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 9 Feb 2015 11:10:41 +0100
> 
> The vunmap() function performs also input parameter validation.
> Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Acked-by: Eli Cohen <eli@mellanox.com>

Applied.
