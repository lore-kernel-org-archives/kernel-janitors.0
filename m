From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 03 Nov 2006 00:09:05 +0000
Subject: Re: [KJ] [patch] net/tipc: sprintf/strcpy conversion
Message-Id: <20061103000905.GA4957@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061101140624.GA7694@Chamillionaire.breakpoint.cc>
In-Reply-To: <20061101140624.GA7694@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, tipc-discussion@lists.sourceforge.net, netdev@vger.kernel.org

On Wed, Nov 01, 2006 at 03:06:24PM +0100, Florian Westphal wrote:
> convert sprintf(a,b) to strcpy(a,b). Make tipc_bclink_name[] const.

Ahhh, I missed the start of threads.

Patch is useless because it changes one unbounded string function into
another unbounded string function.

> --- a/net/tipc/bcast.c
> +++ b/net/tipc/bcast.c
> @@ -790,7 +790,7 @@ int tipc_bclink_init(void)
>  	INIT_LIST_HEAD(&bcbearer->bearer.cong_links);
>  	bcbearer->bearer.media = &bcbearer->media;
>  	bcbearer->media.send_msg = tipc_bcbearer_send;
> -	sprintf(bcbearer->media.name, "tipc-multicast");
> +	strcpy(bcbearer->media.name, "tipc-multicast");
>
>  	bcl = &bclink->link;
>  	memset(bclink, 0, sizeof(struct bclink));
> @@ -802,7 +802,7 @@ int tipc_bclink_init(void)
>  	tipc_link_set_queue_limits(bcl, BCLINK_WIN_DEFAULT);
>  	bcl->b_ptr = &bcbearer->bearer;
>  	bcl->state = WORKING_WORKING;
> -	sprintf(bcl->name, tipc_bclink_name);
> +	strcpy(bcl->name, tipc_bclink_name);
>
>  	if (BCLINK_LOG_BUF_SIZE) {
>  		char *pb = kmalloc(BCLINK_LOG_BUF_SIZE, GFP_ATOMIC);
> --- a/net/tipc/node.c
> +++ b/net/tipc/node.c
> @@ -667,7 +667,7 @@ struct sk_buff *tipc_node_get_links(cons
>          link_info.dest = tipc_own_addr & 0xfffff00;
>  	link_info.dest = htonl(link_info.dest);
>          link_info.up = htonl(1);
> -        sprintf(link_info.str, tipc_bclink_name);
> +        strcpy(link_info.str, tipc_bclink_name);

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
