From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sat, 24 Sep 2016 12:58:54 +0000
Subject: Re: [PATCH 02/10] firewire-net: Rename a jump label in fwnet_broadcast_start()
Message-Id: <20160924145854.60bfba05@kant>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
        <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
        <1f06a795-8595-9f3d-7eb3-28c9d6c5289c@users.sourceforge.net>
In-Reply-To: <1f06a795-8595-9f3d-7eb3-28c9d6c5289c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux1394-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sep 18 SF Markus Elfring wrote:
> Adjust jump labels according to the current Linux coding style
> convention.

The current CodingStyle says:  "Choose label names which say what the goto
does or why the goto exists."  Given the choice between /what/ and /why/,
I for one lean towards /why/.

In this instance, the what and why is "clean up and exit after an error
occurred".  'failed' looks to me to be a better shorthand of this than
'stop_broadcast'.  The latter merely says /how/ the cleanup is done.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/firewire/net.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
> index 7911f13..89afed3 100644
> --- a/drivers/firewire/net.c
> +++ b/drivers/firewire/net.c
> @@ -1106,7 +1106,7 @@ static int fwnet_broadcast_start(struct
> fwnet_device *dev) ptrptr = kmalloc_array(num_packets, sizeof(*ptrptr),
> GFP_KERNEL); if (!ptrptr) {
>  		retval = -ENOMEM;
> -		goto failed;
> +		goto stop_broadcast;
>  	}
>  	dev->broadcast_rcv_buffer_ptrs = ptrptr;
>  
> @@ -1116,13 +1116,13 @@ static int fwnet_broadcast_start(struct
> fwnet_device *dev) fwnet_receive_broadcast, dev);
>  	if (IS_ERR(context)) {
>  		retval = PTR_ERR(context);
> -		goto failed;
> +		goto stop_broadcast;
>  	}
[...]
> @@ -1166,8 +1166,7 @@ static int fwnet_broadcast_start(struct
> fwnet_device *dev) dev->broadcast_state = FWNET_BROADCAST_RUNNING;
>  
>  	return 0;
> -
> - failed:
> + stop_broadcast:
>  	__fwnet_broadcast_stop(dev);
>  	return retval;
>  }

I see no reason to remove the blank line between the return statement and
the label.
-- 
Stefan Richter
-===----- =--= =---
http://arcgraph.de/sr/
