From: Taehee Yoo <ap420073@gmail.com>
Date: Tue, 29 Oct 2019 17:36:22 +0000
Subject: Re: [bug report] vxlan: add adjacent link to limit depth level
Message-Id: <CAMArcTXwz33W13eL=vULE5EUL9Cwi+vHwJf=pC-dP6JBQ_QuYw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029145247.GA24739@mwanda>
In-Reply-To: <20191029145247.GA24739@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 29 Oct 2019 at 23:52, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>

Hi Dan!

> Hello Taehee Yoo,
>
> This is a semi-automatic email about new static checker warnings.
>
> The patch 0ce1822c2a08: "vxlan: add adjacent link to limit depth
> level" from Oct 21, 2019, leads to the following Smatch complaint:
>
>     drivers/net/vxlan.c:4012 vxlan_changelink()
>     error: we previously assumed 'lowerdev' could be null (see line 4009)
>
> drivers/net/vxlan.c
>   4008          netdev_adjacent_change_commit(dst->remote_dev, lowerdev, dev);
>   4009          if (lowerdev && lowerdev != dst->remote_dev)
>                     ^^^^^^^^
> The patch adds a check for NULL,
>
>   4010                  dst->remote_dev = lowerdev;
>   4011
>   4012          netdev_update_lockdep_key(lowerdev);
>                                           ^^^^^^^^
> but it also adds a new unchecked dereference (inside the function).
>
>   4013          vxlan_config_apply(dev, &conf, lowerdev, vxlan->net, true);
>   4014          return 0;
>

Thank you very much for reporting this bug.
While I'm taking look at this bug, I found a more serious bug that is
to break existing configuration.
Anyway, I will fix this bug as soon as possible.

Thank you so much again,
Taehee Yoo

> regards,
> dan carpenter
