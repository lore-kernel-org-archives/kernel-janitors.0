From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 18 Apr 2016 13:41:03 +0000
Subject: Re: [patch -next] udp: fix if statement in SIOCINQ ioctl
Message-Id: <CAF=yD-J3D4HntLHfLjT7_9oj+nWqXjBww3SdNDDSsQxpvfwiUQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160418084449.GA12410@mwanda> <1460981977.10638.105.camel@edumazet-glaptop3.roam.corp.google.com>
In-Reply-To: <1460981977.10638.105.camel@edumazet-glaptop3.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Willem de Bruijn <willemb@google.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Apr 18, 2016 at 8:19 AM, Eric Dumazet <eric.dumazet@gmail.com> wrote:
> On Mon, 2016-04-18 at 11:44 +0300, Dan Carpenter wrote:
>> We deleted a line of code and accidentally made the "return put_user()"
>> part of the if statement when it's supposed to be unconditional.
>>
>> Fixes: 9f9a45beaa96 ('udp: do not expect udp headers on ioctl SIOCINQ')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Acked-by: Eric Dumazet <edumazet@google.com>

Acked-by: Willem de Bruijn <willemb@google.com>

Thanks for catching this.
