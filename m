From: Christoph Hellwig <hch@infradead.org>
Date: Fri, 23 Jul 2004 16:06:54 +0000
Subject: [Kernel-janitors] Re: sleep_on removal from drivers/net/shaper.c
Message-Id: <20040723160654.GA31771@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============256934579348993=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============256934579348993==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2004 at 05:41:28PM +0200, Domen Puncer wrote:
> --- c/drivers/net/shaper.c	Wed Jun 16 07:19:43 2004
> +++ a/drivers/net/shaper.c	Fri Jul 23 17:25:07 2004
> @@ -112,7 +112,7 @@
>  	while (test_and_set_bit(0, &sh->locked))
>  	{
>  		if (!in_interrupt())
> -			sleep_on(&sh->wait_queue);
> +			wait_event(sh->wait_queue, 0);
>  		else
>  			return 0;


wait_event on a non-schaning event is rather buggy.  As a first aid wait
for test_bit on sh->locked, but this whole loop screams for beeing replaced
by proper locking-primitives.

--===============256934579348993==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============256934579348993==--
