From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 19 Dec 2019 13:56:50 +0000
Subject: Re: [PATCH net] af_packet: refactoring code for prb_calc_retire_blk_tmo
Message-Id: <CA+FuTScgWi905_NhGNsRzpwaQ+OPwahj6NtKgPjLZRjuqJvhXQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191219013344.34603-1-maowenan@huawei.com>
In-Reply-To: <20191219013344.34603-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, maximmi@mellanox.com, Paolo Abeni <pabeni@redhat.com>, yuehaibing@huawei.com, Neil Horman <nhorman@tuxdriver.com>, Network Development <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Dec 18, 2019 at 8:37 PM Mao Wenan <maowenan@huawei.com> wrote:
>
> If __ethtool_get_link_ksettings() is failed and with
> non-zero value, prb_calc_retire_blk_tmo() should return
> DEFAULT_PRB_RETIRE_TOV firstly. Refactoring code and make
> it more readable.
>
> Fixes: b43d1f9f7067 ("af_packet: set defaule value for tmo")

This is a pure refactor, not a fix.

Code refactors make backporting fixes across releases harder, among
other things. I think this code is better left as is. Either way, it
would be a candidate for net-next, not net.

> -       unsigned int mbits = 0, msec = 0, div = 0, tmo = 0;
> +       unsigned int mbits = 0, msec = 1, div = 0, tmo = 0;

Most of these do not need to be initialized here at all, really.
