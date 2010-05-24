From: =?UTF-8?Q?Sjur_Br=C3=A6ndeland?= <sjurbren@gmail.com>
Date: Mon, 24 May 2010 19:56:01 +0000
Subject: Re: [patch] caif: remove unneeded null check in caif_connect()
Message-Id: <AANLkTikM6_-YgLcBtcxN_TA1ISHkRk6fCEJVOS7pRZel@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100522204342.GV22515@bicker>
In-Reply-To: <20100522204342.GV22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>, Sjur Braendeland <sjur.brandeland@stericsson.com>, Eric Dumazet <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> wrote:
> We already dereferenced uaddr towards the start of the function when we
> checked that "uaddr->sa_family != AF_CAIF".  Both the check here and the
> earlier check were added in bece7b2398d0: "caif: Rewritten socket
> implementation".  Before that patch, we assumed that we recieved a valid
> pointer for uaddr, and based on that, I have removed this check.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Thanks Looks good,
Acked-by: Sjur Braendeland <sjur.brandeland@stericsson.com>
