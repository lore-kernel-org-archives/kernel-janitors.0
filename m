From: James Hogan <james.hogan@imgtec.com>
Date: Fri, 08 Nov 2013 11:33:37 +0000
Subject: Re: [patch] metag: off by one in setup_bootmem_node()
Message-Id: <527CCC11.9000709@imgtec.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131108094533.GD27977@elgon.mountain>
In-Reply-To: <20131108094533.GD27977@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 08/11/13 09:45, Dan Carpenter wrote:
> If "nid = MAX_NUMNODES" then we write beyond the end of the node_data[]
> array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/metag/mm/numa.c b/arch/metag/mm/numa.c
> index 9ae578c..b172aa4 100644
> --- a/arch/metag/mm/numa.c
> +++ b/arch/metag/mm/numa.c
> @@ -34,7 +34,7 @@ void __init setup_bootmem_node(int nid, unsigned long start, unsigned long end)
>  	unsigned long pgdat_paddr;
>  
>  	/* Don't allow bogus node assignment */
> -	BUG_ON(nid > MAX_NUMNODES || nid <= 0);
> +	BUG_ON(nid >= MAX_NUMNODES || nid <= 0);
>  
>  	start_pfn = start >> PAGE_SHIFT;
>  	end_pfn = end >> PAGE_SHIFT;

Thanks, Applied for v3.13.

Cheers
James

