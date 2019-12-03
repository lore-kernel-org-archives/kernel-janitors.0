From: David Miller <davem@davemloft.net>
Date: Tue, 03 Dec 2019 19:19:51 +0000
Subject: Re: [PATCH v2] net: fix a leak in register_netdevice()
Message-Id: <20191203.111951.52254124666913970.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5DE6663F.40803@bfs.de>
        <20191203141239.hztnqxtsa67ramsh@kili.mountain>
In-Reply-To: <20191203141239.hztnqxtsa67ramsh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, wharms@bfs.de, idosch@mellanox.com, petrm@mellanox.com, pabeni@redhat.com, edumazet@google.com, ap420073@gmail.com, stephen@networkplumber.org, alobakin@dlink.ru, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 3 Dec 2019 17:12:39 +0300

> We have to free "dev->name_node" on this error path.
> 
> Fixes: ff92741270bf ("net: introduce name_node struct to be used in hashlist")
> Reported-by: syzbot+6e13e65ffbaa33757bcb@syzkaller.appspotmail.com
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: dev->name_node can't be NULL so we can remove the check for that
>     in the cleanup code.

Applied, thanks Dan.
