From: David Miller <davem@davemloft.net>
Date: Mon, 05 Aug 2019 17:30:02 +0000
Subject: Re: [PATCH net-next v3] net: can: Fix compiling warnings for two functions
Message-Id: <20190805.103002.641507066504156536.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6fd68e9b-a8ae-4e5e-9b23-c099b5ca9aa4@web.de>
        <20190805115744.112440-1-maowenan@huawei.com>
In-Reply-To: <20190805115744.112440-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: socketcan@hartkopp.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 5 Aug 2019 19:57:44 +0800

> @@ -1680,7 +1680,7 @@ static int bcm_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
>  	return size;
>  }
>  
> -int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
> +static int bcm_sock_no_ioctlcmd(struct socket *sock, unsigned int cmd,
>  			 unsigned long arg)

The alignment of the second line here needs to be adjusted, it must start
precisely at the first column after the openning parenthesis of the first
line.

Same for the other change in this patch.
