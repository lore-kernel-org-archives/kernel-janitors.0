From: Florian Westphal <fw-kernel@strlen.de>
Date: Thu, 02 Nov 2006 06:26:56 +0000
Subject: Re: [KJ] [tipc-discussion] [patch] net/tipc: sprintf/strcpy
Message-Id: <20061102062656.GA8339@Chamillionaire.breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061101140624.GA7694@Chamillionaire.breakpoint.cc> <454913D2.9050608@bfs.de>
In-Reply-To: <454913D2.9050608@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tipc-discussion@lists.sourceforge.net, kernel-janitors@lists.osdl.org, netdev@vger.kernel.org

walter harms <wharms@bfs.de> wrote:
> These line
>+       strcpy(bcbearer->media.name, "tipc-multicast");
> i gues that means tipc_bclink_name ?

The idea was to change how things are done, not _what_ is being done.

> an even more secure version could be like this:
> 
> 	strncpy(bcbearer->media.name,sizeof(bcbearer->media.name),tipc_bclink_name);

Ugh, please, no. The size of src is known in all cases; there is
absoluty no point in using str(n|l)cpy here.

> (in case someone ever changes the size of cbearer->media.name or tipc_bclink_name and the hope
> that wchat_t will never reach the kernel)

In this case 'someone' should be really hurt, don't you think?

Florian
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
