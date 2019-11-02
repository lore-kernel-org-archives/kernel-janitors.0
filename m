From: Stefano Garzarella <sgarzare@redhat.com>
Date: Sat, 02 Nov 2019 17:11:50 +0000
Subject: Re: [PATCH] vsock: Simplify '__vsock_release()'
Message-Id: <CAGxU2F5wS9VnNu5ETFbbFcyaCx+UPD9jqjBPVp_rKKZ0-am1tQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031064741.4567-1-christophe.jaillet@wanadoo.fr>
 <c7a0b6b0-96cd-1fd3-3d98-94a3692bda38@cogentembedded.com> <1b33ca33-a02b-1923-cbee-814e520b9700@wanadoo.fr>
In-Reply-To: <1b33ca33-a02b-1923-cbee-814e520b9700@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "David S. Miller" <davem@davemloft.net>, sunilmut@microsoft.com, Willem de Bruijn <willemb@google.com>, Stefan Hajnoczi <stefanha@redhat.com>, ytht.net@gmail.com, Arnd Bergmann <arnd@arndb.de>, tglx@linutronix.de, Dexuan Cui <decui@microsoft.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 31, 2019 at 10:49 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 31/10/2019 à 10:36, Sergei Shtylyov a écrit :
> > Hello!
> >
> > On 31.10.2019 9:47, Christophe JAILLET wrote:
> >
> >> Use '__skb_queue_purge()' instead of re-implementing it.
> >
> >    In don't see that double underscore below...
> This is a typo in the commit message.
>
> There is no need for __ because skb_dequeue was used.
>
> Could you fix it directly in the commit message (preferred solution for
> me) or should I send a V2?
>

I think is better if you send a v2 fixing this and including the R-b tags.
My R-b stays with that fixed :-)

Thanks,
Stefano
