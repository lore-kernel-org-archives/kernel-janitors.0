From: David Miller <davem@davemloft.net>
Date: Tue, 11 Jun 2019 19:13:50 +0000
Subject: Re: [PATCH -next v2] packet: remove unused variable 'status' in __packet_lookup_frame_in_block
Message-Id: <20190611.121350.119608921995403526.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAF=yD-+g1bSGOubFUE8veZNvGiPy1oYsf+dFDd=hqXYD+k4g_Q@mail.gmail.com>
        <20190611013213.142745-1-maowenan@huawei.com>
In-Reply-To: <20190611013213.142745-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 11 Jun 2019 09:32:13 +0800

> The variable 'status' in  __packet_lookup_frame_in_block() is never used since
> introduction in commit f6fb8f100b80 ("af-packet: TPACKET_V3 flexible buffer
> implementation."), we can remove it.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  v2: don't change parameter from 0 to TP_STATUS_KERNEL when calls 
>  prb_retire_current_block(). 

Applied.
