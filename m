From: walter harms <wharms@bfs.de>
Date: Thu, 01 Dec 2011 09:56:01 +0000
Subject: Re: [patch] Staging: lttng: dubious one-bit signed bitfields
Message-Id: <4ED74F31.5010604@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111201093746.GA1250@elgon.mountain>
In-Reply-To: <20111201093746.GA1250@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,
This patch looks ok to me but this design is ugly by itself.
It should be replaced by an uchar uint whatever or use a
real bool (obviously not preferred by this programmes).

re,
 wh

Am 01.12.2011 10:37, schrieb Dan Carpenter:
> Sparse complains that these signed bitfields look "dubious".  The
> problem is that instead of being either 0 or 1 like people would expect,
> signed one bit variables like this are either 0 or -1.  It doesn't cause
> a problem in this case but it's ugly so lets fix them.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I just did this against linux next but it applies fine on top of
> Mathieu's recent patches.
> 
> diff --git a/drivers/staging/lttng/lib/ringbuffer/backend_types.h b/drivers/staging/lttng/lib/ringbuffer/backend_types.h
> index 1d301de..019929a 100644
> --- a/drivers/staging/lttng/lib/ringbuffer/backend_types.h
> +++ b/drivers/staging/lttng/lib/ringbuffer/backend_types.h
> @@ -65,7 +65,7 @@ struct channel_backend {
>  					 * for writer.
>  					 */
>  	unsigned int buf_size_order;	/* Order of buffer size */
> -	int extra_reader_sb:1;		/* Bool: has extra reader subbuffer */
> +	unsigned int extra_reader_sb:1;	/* Bool: has extra reader subbuffer */
>  	struct lib_ring_buffer *buf;	/* Channel per-cpu buffers */
>  
>  	unsigned long num_subbuf;	/* Number of sub-buffers for writer */
> diff --git a/drivers/staging/lttng/lib/ringbuffer/frontend_types.h b/drivers/staging/lttng/lib/ringbuffer/frontend_types.h
> index 5c7437f..9086c58 100644
> --- a/drivers/staging/lttng/lib/ringbuffer/frontend_types.h
> +++ b/drivers/staging/lttng/lib/ringbuffer/frontend_types.h
> @@ -60,8 +60,8 @@ struct channel {
>  	struct notifier_block cpu_hp_notifier;	/* CPU hotplug notifier */
>  	struct notifier_block tick_nohz_notifier; /* CPU nohz notifier */
>  	struct notifier_block hp_iter_notifier;	/* hotplug iterator notifier */
> -	int cpu_hp_enable:1;			/* Enable CPU hotplug notif. */
> -	int hp_iter_enable:1;			/* Enable hp iter notif. */
> +	unsigned int cpu_hp_enable:1;		/* Enable CPU hotplug notif. */
> +	unsigned int hp_iter_enable:1;		/* Enable hp iter notif. */
>  	wait_queue_head_t read_wait;		/* reader wait queue */
>  	wait_queue_head_t hp_wait;		/* CPU hotplug wait queue */
>  	int finalized;				/* Has channel been finalized */
> @@ -94,8 +94,8 @@ struct lib_ring_buffer_iter {
>  		ITER_NEXT_RECORD,
>  		ITER_PUT_SUBBUF,
>  	} state;
> -	int allocated:1;
> -	int read_open:1;		/* Opened for reading ? */
> +	unsigned int allocated:1;
> +	unsigned int read_open:1;		/* Opened for reading ? */
>  };
>  
>  /* ring buffer state */
> @@ -138,9 +138,9 @@ struct lib_ring_buffer {
>  	unsigned long get_subbuf_consumed;	/* Read-side consumed */
>  	unsigned long prod_snapshot;	/* Producer count snapshot */
>  	unsigned long cons_snapshot;	/* Consumer count snapshot */
> -	int get_subbuf:1;		/* Sub-buffer being held by reader */
> -	int switch_timer_enabled:1;	/* Protected by ring_buffer_nohz_lock */
> -	int read_timer_enabled:1;	/* Protected by ring_buffer_nohz_lock */
> +	unsigned int get_subbuf:1;		/* Sub-buffer being held by reader */
> +	unsigned int switch_timer_enabled:1;	/* Protected by ring_buffer_nohz_lock */
> +	unsigned int read_timer_enabled:1;	/* Protected by ring_buffer_nohz_lock */
>  };
>  
>  static inline
> diff --git a/drivers/staging/lttng/ltt-events.h b/drivers/staging/lttng/ltt-events.h
> index 36b281a..3fc355d 100644
> --- a/drivers/staging/lttng/ltt-events.h
> +++ b/drivers/staging/lttng/ltt-events.h
> @@ -191,7 +191,7 @@ struct ltt_event {
>  		} ftrace;
>  	} u;
>  	struct list_head list;		/* Event list */
> -	int metadata_dumped:1;
> +	unsigned int metadata_dumped:1;
>  };
>  
>  struct ltt_channel_ops {
> @@ -251,7 +251,7 @@ struct ltt_channel {
>  	struct ltt_event *sc_compat_unknown;
>  	struct ltt_event *sc_exit;	/* for syscall exit */
>  	int header_type;		/* 0: unset, 1: compact, 2: large */
> -	int metadata_dumped:1;
> +	unsigned int metadata_dumped:1;
>  };
>  
>  struct ltt_session {
> @@ -264,7 +264,7 @@ struct ltt_session {
>  	struct list_head list;		/* Session list */
>  	unsigned int free_chan_id;	/* Next chan ID to allocate */
>  	uuid_le uuid;			/* Trace session unique ID */
> -	int metadata_dumped:1;
> +	unsigned int metadata_dumped:1;
>  };
>  
>  struct ltt_session *ltt_session_create(void);
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
