From: David Miller <davem@davemloft.net>
Date: Thu, 26 Dec 2019 23:20:16 +0000
Subject: Re: [PATCH net-next v2] af_packet: refactoring code for prb_calc_retire_blk_tmo
Message-Id: <20191226.152016.1920270671846157194.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+FuTScgWi905_NhGNsRzpwaQ+OPwahj6NtKgPjLZRjuqJvhXQ@mail.gmail.com>
        <20191223104257.132354-1-maowenan@huawei.com>
In-Reply-To: <20191223104257.132354-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: edumazet@google.com, willemb@google.com, maximmi@mellanox.com, pabeni@redhat.com, yuehaibing@huawei.com, nhorman@tuxdriver.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, willemdebruijn.kernel@gmail.com

From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 23 Dec 2019 18:42:57 +0800

> If __ethtool_get_link_ksettings() is failed and with
> non-zero value, prb_calc_retire_blk_tmo() should return
> DEFAULT_PRB_RETIRE_TOV firstly. 
> 
> This patch is to refactory code and make it more readable.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied, thanks.
