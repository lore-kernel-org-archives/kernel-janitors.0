From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong@gmail.com>
Date: Sun, 12 Jun 2011 05:48:51 +0000
Subject: Re: [patch] netpoll: call dev_put() on error in netpoll_setup()
Message-Id: <BANLkTin9d0kEzOcNGt-x49caagLz5uRDEg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110611155047.GA3583@shale.localdomain>
In-Reply-To: <20110611155047.GA3583@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: WANG Cong <amwang@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, Neil Horman <nhorman@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jun 11, 2011 at 11:50 PM, Dan Carpenter <error27@gmail.com> wrote:
> There is a dev_put(ndev) missing on an error path. =C2=A0This was
> introduced in 0c1ad04aecb "netpoll: prevent netpoll setup on slave
> devices".
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> This is a static checker bug, and it's possible I've misunderstood
> something.

Oops! My bad... you don't miss anything.

Thanks a lot for fixing it!
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
