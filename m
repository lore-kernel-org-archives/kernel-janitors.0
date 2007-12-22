From: Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 22 Dec 2007 10:31:37 +0000
Subject: Re: [PATCH 2/3] msg.h: Convert m_ts from int to size_t.
Message-Id: <20071222023137.c8800f6f.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20071217023555.24944.62155.sendpatchset@thinktank.campus.ltu.se>
	<20071217023600.24944.84644.sendpatchset@thinktank.campus.ltu.se>
In-Reply-To: <20071217023600.24944.84644.sendpatchset@thinktank.campus.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Knutsson <ricknu-0@student.ltu.se>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 17 Dec 2007 03:36:00 +0100 (MET) Richard Knutsson <ricknu-0@student.ltu.se> wrote:

> Convert m_ts ("message text size") from int to size_t.
> 
> Signed-off-by: Richard Knutsson <ricknu-0@student.ltu.se>
> ---
> Remove some trailing spaces, since we are in the neighborhood.
> 
> 
> diff --git a/include/linux/msg.h b/include/linux/msg.h
> index 10a3d5a..7a61952 100644
> --- a/include/linux/msg.h
> +++ b/include/linux/msg.h
> @@ -67,8 +67,8 @@ struct msginfo {
>  /* one msg_msg structure for each message */
>  struct msg_msg {
>  	struct list_head m_list; 
> -	long  m_type;          
> -	int m_ts;           /* message text size */
> +	long  m_type;
> +	size_t m_ts;           /* message text size */
>  	struct msg_msgseg* next;
>  	void *security;
>  	/* the actual message follows immediately */

hm, spose so.  But if we're to do this then we'd need to fix qsize and
r_maxsize and various other things.  And we'd need to convert msg_bytes to
atomic_size_t, which would prove interesting ;)

So this is at best a partial conversion and the code in there does need
careful checking for the use of appropriate types.  Does this patch get us
partway toward the proper solution?  Dunno - someone would need to sit down
and work out what the best types are for all those related things.


