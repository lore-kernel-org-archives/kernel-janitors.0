From: Francois Romieu <romieu@fr.zoreil.com>
Date: Thu, 19 Feb 2004 23:02:13 +0000
Subject: Re: Re: [Kernel-janitors] Re: 2.6.1: net/ipv4/fib_hash.c: check
Message-Id: <20040220000213.B8262@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040217095525.GD29263@conectiva.com.br>
In-Reply-To: <20040217095525.GD29263@conectiva.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Walter Harms <WHarms@bfs.de> :
[...]
> nice idea to turn the problem on its head. I would prefer a
> if (!tb)
>    return NULL;
> instead a goto (as opposed to acme) i dont like goto's if called only once :)

It is called twice to have a single return point in the function.

We do not want to cross the streams, do we ?

--
Ueimor
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
