From: Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 28 Sep 2019 22:04:10 +0000
Subject: Re: [PATCH] mm, vmpressure: Fix a signedness bug in vmpressure_register_event()
Message-Id: <20190928150410.5964a7935ca1b3cb47a2ae76@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925110449.GO3264@mwanda>
	<20190928142356.932cff0ad6c17f4a18edc80f@linux-foundation.org>
	<20190928214702.GA30382@bombadil.infradead.org>
In-Reply-To: <20190928214702.GA30382@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tglx@linutronix.de, Enrico Weigelt <info@metux.net>, Kate Stewart <kstewart@linuxfoundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 28 Sep 2019 14:47:02 -0700 Matthew Wilcox <willy@infradead.org> wrote:

> On Sat, Sep 28, 2019 at 02:23:56PM -0700, Andrew Morton wrote:
> > How about doing it this way?  Only copy the int to the enum once we
> > know it's within range?
> 
> This will return a positive integer on success instead of 0.  We need:
> 
>  	mutex_unlock(&vmpr->events_lock);
> +	ret = 0;
>  out:
> 
> with that,
> 
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> 
> How about further adding ...
> 
> + * Return: 0 on success, -ENOMEM on memory failure or -EINVAL if @args could
> + * not be parsed.

Cool.

--- a/mm/vmpressure.c~mm-vmpressure-fix-a-signedness-bug-in-vmpressure_register_event-fix-fix
+++ a/mm/vmpressure.c
@@ -355,6 +355,9 @@ void vmpressure_prio(gfp_t gfp, struct m
  * "hierarchy" or "local").
  *
  * To be used as memcg event method.
+ *
+ * Return: 0 on success, -ENOMEM on memory failure or -EINVAL if @args could
+ * not be parsed.
  */
 int vmpressure_register_event(struct mem_cgroup *memcg,
 			      struct eventfd_ctx *eventfd, const char *args)
@@ -402,6 +405,7 @@ int vmpressure_register_event(struct mem
 	mutex_lock(&vmpr->events_lock);
 	list_add(&ev->node, &vmpr->events);
 	mutex_unlock(&vmpr->events_lock);
+	ret = 0;
 out:
 	kfree(spec_orig);
 	return ret;
_
