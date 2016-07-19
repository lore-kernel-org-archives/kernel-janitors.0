From: Jason Wang <jasowang@redhat.com>
Date: Tue, 19 Jul 2016 06:33:19 +0000
Subject: Re: [bug report] macvtap: switch to use skb array
Message-Id: <578DC9AF.4020708@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160718150651.GA31660@mwanda>
In-Reply-To: <20160718150651.GA31660@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org



On 2016年07月19日 02:26, Dan Carpenter wrote:
> Hello Jason Wang,
>
> The patch 362899b8725b: "macvtap: switch to use skb array" from Jul
> 15, 2016, leads to the following static checker warning:
>
> 	drivers/net/macvtap.c:539 macvtap_sock_destruct()
> 	error: use kfree_skb() here instead of kfree(skb)
>
> drivers/net/macvtap.c
>     533  static void macvtap_sock_destruct(struct sock *sk)
>     534  {
>     535          struct macvtap_queue *q = container_of(sk, struct macvtap_queue, sk);
>     536          struct sk_buff *skb;
>     537
>     538          while ((skb = skb_array_consume(&q->skb_array)) != NULL)
>     539                  kfree(skb);
>
> Should be kfree_skb().  On my way to airport or would send patch.

Patch sent, thanks a lot!

>
>     540  }
>
> regards,
> dan carpenter

