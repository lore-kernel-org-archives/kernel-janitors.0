From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Jan 2020 16:18:27 +0000
Subject: Re: [PATCH] net/rose: remove redundant assignment to variable failed
Message-Id: <20200107161827.GO3911@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107152415.106353-1-colin.king@canonical.com>
In-Reply-To: <20200107152415.106353-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "David S . Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 07, 2020 at 03:24:15PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable failed is being assigned a value that is never read, the
> following goto statement jumps to the end of the function and variable
> failed is not referenced at all.  Remove the redundant assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/rose/rose_route.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
> index c53307623236..5277631fa14c 100644
> --- a/net/rose/rose_route.c
> +++ b/net/rose/rose_route.c
> @@ -696,7 +696,6 @@ struct rose_neigh *rose_get_neigh(rose_address *addr, unsigned char *cause,
>  				for (i = 0; i < node->count; i++) {
>  					if (!rose_ftimer_running(node->neighbour[i])) {
>  						res = node->neighbour[i];
> -						failed = 0;
>  						goto out;
>  					}
>  					failed = 1;

I don't know the code, but I would have expected the out label to come
earlier:


        }
        if (!route_frame) { /* connect request */
                for (node = rose_node_list; node != NULL; node = node->next) {
                        if (rosecmpm(addr, &node->address, node->mask) = 0) {
                                for (i = 0; i < node->count; i++) {
                                        if (!rose_ftimer_running(node->neighbour[i])) {
                                                res = node->neighbour[i];
                                                failed = 0;
                                                goto out;
                                        }
                                        failed = 1;
                                }
                        }
                }
        }

<--------***********  I would have expected it to be right here.
        if (failed) {
                *cause      = ROSE_OUT_OF_ORDER;
                *diagnostic = 0;
        } else {
                *cause      = ROSE_NOT_OBTAINABLE;
                *diagnostic = 0;
        }

out:
        if (!route_frame) spin_unlock_bh(&rose_node_list_lock);
        return res;

regards,
dan carpenter
