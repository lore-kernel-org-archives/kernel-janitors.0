From: David Miller <davem@davemloft.net>
Date: Wed, 01 Nov 2006 23:19:17 +0000
Subject: Re: [KJ] [patch] net/tipc: sprintf/strcpy conversion
Message-Id: <20061101.151917.133285028.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061101140624.GA7694@Chamillionaire.breakpoint.cc>
	<454913D2.9050608@bfs.de>
In-Reply-To: <454913D2.9050608@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: kernel-janitors@lists.osdl.org, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org

From: walter harms <wharms@bfs.de>
Date: Wed, 01 Nov 2006 22:38:26 +0100

> These line
> +	strcpy(bcbearer->media.name, "tipc-multicast");
> 
> i gues that means tipc_bclink_name ?

Why?  The original code used "tipc-multicast" which is a
different string than tipc_bclink_name which is "multicast-link".

> > -	sprintf(bcbearer->media.name, "tipc-multicast");
> > +	strcpy(bcbearer->media.name, "tipc-multicast");

If you are arguing that it should be changed, that's a different
changeset to discuss.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
