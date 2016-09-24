From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sat, 24 Sep 2016 11:41:10 +0000
Subject: Re: [PATCH 01/] firewire-net: Use kmalloc_array() in fwnet_broadcast_start()
Message-Id: <20160924134110.35e63471@kant>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
        <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
        <d0a380d4-a0a5-137c-054f-ac14d441f2af@users.sourceforge.net>
In-Reply-To: <d0a380d4-a0a5-137c-054f-ac14d441f2af@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux1394-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sep 18 SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 17 Sep 2016 21:55:42 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "kmalloc_array".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Replace the specification of a data type by a pointer dereference
>   to make the corresponding size determination a bit safer according to
>   the Linux coding style convention.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/firewire/net.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
> index 309311b..7911f13 100644
> --- a/drivers/firewire/net.c
> +++ b/drivers/firewire/net.c
> @@ -1103,8 +1103,7 @@ static int fwnet_broadcast_start(struct fwnet_device *dev)
>  
>  	max_receive = 1U << (dev->card->max_receive + 1);
>  	num_packets = (FWNET_ISO_PAGE_COUNT * PAGE_SIZE) / max_receive;
> -
> -	ptrptr = kmalloc(sizeof(void *) * num_packets, GFP_KERNEL);
> +	ptrptr = kmalloc_array(num_packets, sizeof(*ptrptr), GFP_KERNEL);
>  	if (!ptrptr) {
>  		retval = -ENOMEM;
>  		goto failed;

Coccinelle enabled you to determine that kmalloc_array /could/ be used
here.  But whether it /should/ be used here is another question, and it is
not addressed in your changelog.  (You state that there is an "issue" but
do not explain.)

kmalloc_array is a kmalloc wrapper which adds an inline check for integer
overflow.  So, can sizeof(void *) * num_packets ever overflow size_t?

If yes,
	do we want a runtime check here (which kmalloc_array provides),
	or do we want a compile-time check?

If no,
	then the remaining benefit of the patch is that it is more obvious
	to the reader that dev->broadcast_rcv_buffer_ptrs is an array,
	but possibly at the cost of superfluous code.  Is gcc's optimizer
	able to resolve kmalloc_array's check at compile time as always
	false, such that the superfluous code is eliminated as dead code?

I believe I know answers to this but prefer to hear what you as the patch
author think about it.
-- 
Stefan Richter
-===----- =--= =---
http://arcgraph.de/sr/
