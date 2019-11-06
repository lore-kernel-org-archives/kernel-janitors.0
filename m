From: David Miller <davem@davemloft.net>
Date: Wed, 06 Nov 2019 01:56:02 +0000
Subject: Re: [PATCH v2] vsock: Simplify '__vsock_release()'
Message-Id: <20191105.175602.1449990154803335127.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191103061111.22003-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191103061111.22003-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: stefanha@redhat.com, ytht.net@gmail.com, sunilmut@microsoft.com, willemb@google.com, arnd@arndb.de, tglx@linutronix.de, decui@microsoft.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sgarzare@redhat.com

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun,  3 Nov 2019 07:11:11 +0100

> Use 'skb_queue_purge()' instead of re-implementing it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Applied to net-next, thanks.
