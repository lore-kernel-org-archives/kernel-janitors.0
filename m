From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 08 Jul 2014 06:12:59 +0000
Subject: Re: [PATCH] appletalk: Fix socket referencing in skb
Message-Id: <1404799979.3515.0.camel@edumazet-glaptop2.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404764570-24120-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1404764570-24120-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, acme@ghostprotocols.net, davem@davemloft.net

On Mon, 2014-07-07 at 23:22 +0300, Andrey Utkin wrote:
> Setting just skb->sk without taking its reference and setting a
> destructor is invalid. However, in the places where this was done, skb
> is used in a way not requiring skb->sk setting. So dropping the setting
> of skb->sk.
> Thanks to Eric Dumazet <eric.dumazet@gmail.com> for correct solution.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?idy441
> Reported-by: Ed Martin <edman007@edman007.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
> ---

Thanks !

Signed-off-by: Eric Dumazet <edumazet@google.com>


