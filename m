From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 May 2015 13:03:38 +0000
Subject: Re: [PATCH v4 05/13] staging: lustre: lnet: o2iblnd: code cleanup - align whitespace
Message-Id: <20150522130338.GO4150@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
 <1432237849-53947-6-git-send-email-shuey@purdue.edu>
In-Reply-To: <1432237849-53947-6-git-send-email-shuey@purdue.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Shuey <shuey@purdue.edu>
Cc: oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org

On Thu, May 21, 2015 at 03:50:28PM -0400, Mike Shuey wrote:
> diff --git a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
> index cd664d0..7f52c69 100644
> --- a/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
> +++ b/drivers/staging/lustre/lnet/klnds/o2iblnd/o2iblnd.h
> @@ -80,42 +80,47 @@
>  #define IBLND_N_SCHED_HIGH		4
>  
>  typedef struct {
> -	int	      *kib_dev_failover;     /* HCA failover */
> -	unsigned int     *kib_service;	  /* IB service number */
> -	int	      *kib_min_reconnect_interval; /* first failed connection retry... */
> -	int	      *kib_max_reconnect_interval; /* ...exponentially increasing to this */
> -	int	      *kib_cksum;	    /* checksum kib_msg_t? */
> -	int	      *kib_timeout;	  /* comms timeout (seconds) */
> -	int	      *kib_keepalive;	/* keepalive timeout (seconds) */
> -	int	      *kib_ntx;	      /* # tx descs */
> -	int	      *kib_credits;	  /* # concurrent sends */
> -	int	      *kib_peertxcredits;    /* # concurrent sends to 1 peer */
> -	int	      *kib_peerrtrcredits;   /* # per-peer router buffer credits */
> -	int	      *kib_peercredits_hiw;  /* # when eagerly to return credits */
> -	int	      *kib_peertimeout;      /* seconds to consider peer dead */
> -	char	    **kib_default_ipif;     /* default IPoIB interface */
> -	int	      *kib_retry_count;
> -	int	      *kib_rnr_retry_count;
> -	int	      *kib_concurrent_sends; /* send work queue sizing */
> -	int		 *kib_ib_mtu;		/* IB MTU */
> -	int	      *kib_map_on_demand;    /* map-on-demand if RD has more fragments
> -						 * than this value, 0 disable map-on-demand */
> -	int	      *kib_pmr_pool_size;    /* # physical MR in pool */
> -	int	      *kib_fmr_pool_size;    /* # FMRs in pool */
> -	int	      *kib_fmr_flush_trigger; /* When to trigger FMR flush */
> -	int	      *kib_fmr_cache;	/* enable FMR pool cache? */
> -	int	      *kib_require_priv_port;/* accept only privileged ports */
> -	int	      *kib_use_priv_port;    /* use privileged port for active connect */
> -	/* # threads on each CPT */
> -	int		 *kib_nscheds;
> +	int          *kib_dev_failover;      /* HCA failover */
> +	unsigned int *kib_service;           /* IB service number */
> +	int          *kib_min_reconnect_interval; /* first failed connection
> +						   * retry... */
> +	int          *kib_max_reconnect_interval; /* ...exponentially increasing
> +						   * to this */
> +	int          *kib_cksum;             /* checksum kib_msg_t? */
> +	int          *kib_timeout;           /* comms timeout (seconds) */
> +	int          *kib_keepalive;         /* keepalive timeout (seconds) */
> +	int          *kib_ntx;               /* # tx descs */
> +	int          *kib_credits;           /* # concurrent sends */
> +	int          *kib_peertxcredits;     /* # concurrent sends to 1 peer */
> +	int          *kib_peerrtrcredits;    /* # per-peer router buffer
> +					      * credits */
> +	int          *kib_peercredits_hiw;   /* # when eagerly to return
> +					      * credits */
> +	int          *kib_peertimeout;       /* seconds to consider peer dead */
> +	char         **kib_default_ipif;     /* default IPoIB interface */
> +	int          *kib_retry_count;
> +	int          *kib_rnr_retry_count;
> +	int          *kib_concurrent_sends;  /* send work queue sizing */
> +	int          *kib_ib_mtu;            /* IB MTU */
> +	int          *kib_map_on_demand;     /* map-on-demand if RD has more
> +					      * fragments than this value, 0
> +					      * disable map-on-demand */
> +	int          *kib_pmr_pool_size;     /* # physical MR in pool */
> +	int          *kib_fmr_pool_size;     /* # FMRs in pool */
> +	int          *kib_fmr_flush_trigger; /* When to trigger FMR flush */
> +	int          *kib_fmr_cache;         /* enable FMR pool cache? */
> +	int          *kib_require_priv_port; /* accept only privileged ports */
> +	int          *kib_use_priv_port;     /* use privileged port for active
> +					      * connect */
> +	int          *kib_nscheds;           /* # threads on each CPT */
>  } kib_tunables_t;

The lustre people have their own style guidelines for these things in
the .h file.  We should probably match theirs.

I don't care one way or the other, what style people use for this.

regards,
dan carpenter

