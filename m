From: Jeff Dike <jdike@addtoit.com>
Date: Thu, 19 Jan 2017 00:07:48 +0000
Subject: Re: [PATCH 2/5] um: port: Delete three error messages for a failed memory allocation
Message-Id: <20170119000748.GB12052@parts.user-mode-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c10b7f33-f573-aa9f-239e-ccca5540f264@users.sourceforge.net>
 <651ecf90-9c68-aec1-58d7-d11e7671ed4c@users.sourceforge.net>
In-Reply-To: <651ecf90-9c68-aec1-58d7-d11e7671ed4c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: user-mode-linux-devel@lists.sourceforge.net, user-mode-linux-user@lists.sourceforge.net, Anton Ivanov <aivanov@kot-begemot.co.uk>, Dan Williams <dan.j.williams@intel.com>, Hannes Reinecke <hare@suse.com>, Jens Axboe <axboe@fb.com>, Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

> --- a/arch/um/drivers/port_kern.c
> +++ b/arch/um/drivers/port_kern.c
> @@ -87,11 +87,8 @@ static int port_accept(struct port_list *port)
>  	}
>  
>  	conn = kmalloc(sizeof(*conn), GFP_ATOMIC);
> -	if (conn = NULL) {
> -		printk(KERN_ERR "port_accept : failed to allocate "
> -		       "connection\n");
> +	if (!conn)
>  		goto out_close;
> -	}
>  	*conn = ((struct connection)
>  		{ .list 	= LIST_HEAD_INIT(conn->list),
>  		  .fd 		= fd,

I don't see how this eliminates a possible error.  It should behave
exactly the same.  To me, this is an expressiveness issue.

!x is something you use with something that is conceptually a Boolean.

x = NULL is a question about a pointer, which is the case here.

				Jeff
-- 
Jeff Dike
AddToIt
978-254-0789 (o)
978-394-8986 (c)
