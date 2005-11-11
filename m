From: walter harms <wharms@bfs.de>
Date: Fri, 11 Nov 2005 08:18:43 +0000
Subject: Re: [KJ] [PATCH 4/9] Create helper for /proc/slabinfo
Message-Id: <437453E3.3040703@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4373DF5D.8050106@us.ibm.com>
In-Reply-To: <4373DF5D.8050106@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi Matthew,
just to have less #if in the code. it maybe usefull to make something 
like that in the beginning:

#if STATS
#define STATS_VERSION "slabinfo - version: 2.1 (statistics)"
#else
#define STATS_VERSION "slabinfo - version: 2.1"
#endif
note i have silently droped "\n" are they realy needed ?

re,
   walter

Matthew Dobson wrote:
> Most of the s_start() function body is just printing out a header for
> /proc/slabinfo.  Move it to its own function.
> 
> -Matt
> 
> 
> ------------------------------------------------------------------------
> 
> In s_start(), if we're at the beginning of printing out /proc/slabinfo, we
> print out a header with version info and descriptions of the fields.  This
> is indented and takes up a lot of space in an otherwise tiny fuction.
> 
> Create a helper, print_slabinfo_header(), that s_start() can call to
> print out it's header.  Remove several long lines, and make both functions
> more readable.
> 
> Signed-off-by: Matthew Dobson <colpatch@us.ibm.com>
> 
> Index: linux-2.6.14+slab_cleanup/mm/slab.c
> =================================> --- linux-2.6.14+slab_cleanup.orig/mm/slab.c	2005-11-10 11:43:40.223347016 -0800
> +++ linux-2.6.14+slab_cleanup/mm/slab.c	2005-11-10 11:43:42.198046816 -0800
> @@ -3378,32 +3378,37 @@ next:
>  
>  #ifdef CONFIG_PROC_FS
>  
> -static void *s_start(struct seq_file *m, loff_t *pos)
> +static inline void print_slabinfo_header(struct seq_file *m)
>  {
> -	loff_t n = *pos;
> -	struct list_head *p;
> -
> -	down(&cache_chain_sem);
> -	if (!n) {
> -		/*
> -		 * Output format version, so at least we can change it
> -		 * without _too_ many complaints.
> -		 */
> +	/*
> +	 * Output format version, so at least we can change it
> +	 * without _too_ many complaints.
> +	 */
>  #if STATS
> -		seq_puts(m, "slabinfo - version: 2.1 (statistics)\n");
> +	seq_puts(m, "slabinfo - version: 2.1 (statistics)\n");
>  #else
> -		seq_puts(m, "slabinfo - version: 2.1\n");
> +	seq_puts(m, "slabinfo - version: 2.1\n");
>  #endif
> -		seq_puts(m, "# name            <active_objs> <num_objs> <objsize> <objperslab> <pagesperslab>");
> -		seq_puts(m, " : tunables <limit> <batchcount> <sharedfactor>");
> -		seq_puts(m, " : slabdata <active_slabs> <num_slabs> <sharedavail>");
> +	seq_puts(m, "# name            <active_objs> <num_objs> <objsize> "
> +		 "<objperslab> <pagesperslab>");
> +	seq_puts(m, " : tunables <limit> <batchcount> <sharedfactor>");
> +	seq_puts(m, " : slabdata <active_slabs> <num_slabs> <sharedavail>");
>  #if STATS
> -		seq_puts(m, " : globalstat <listallocs> <maxobjs> <grown> <reaped>"
> -				" <error> <maxfreeable> <nodeallocs> <remotefrees>");
> -		seq_puts(m, " : cpustat <allochit> <allocmiss> <freehit> <freemiss>");
> +	seq_puts(m, " : globalstat <listallocs> <maxobjs> <grown> <reaped> "
> +		 "<error> <maxfreeable> <nodeallocs> <remotefrees>");
> +	seq_puts(m, " : cpustat <allochit> <allocmiss> <freehit> <freemiss>");
>  #endif
> -		seq_putc(m, '\n');
> -	}
> +	seq_putc(m, '\n');
> +}
> +
> +static void *s_start(struct seq_file *m, loff_t *pos)
> +{
> +	loff_t n = *pos;
> +	struct list_head *p;
> +
> +	down(&cache_chain_sem);
> +	if (!n)
> +		print_slabinfo_header(m);
>  	p = cache_chain.next;
>  	while (n--) {
>  		p = p->next;
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
