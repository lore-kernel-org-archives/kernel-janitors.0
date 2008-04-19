From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 19 Apr 2008 13:47:37 +0000
Subject: ieee1394 incorrect unsigned tests
Message-Id: <20080419134736.GI20637@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 18, 2008 at 09:08:55PM +0200, Julia Lawall wrote:
> I found 63 occurrences of this problem with the following semantic match
> (http://www.emn.fr/x-info/coccinelle/):
> 
> @@ unsigned int i; @@
> 
> * i < 0
> 
> I looked through all of the results by hand, and they all seem to be 
> problems.  In many cases, it seems like the variable should not be 
> unsigned as it is used to hold the return value of a function that might 
> return a negative error code, but I haven't looked into this in detail.

> diff -u -p a/drivers/ieee1394/dv1394.c b/drivers/ieee1394/dv1394.c
> *** a/drivers/ieee1394/dv1394.c 2008-03-12 14:13:13.000000000 +0100
> @@ -918,7 +918,7 @@ static int do_dv1394_init(struct video_c
>  		/* default SYT offset is 3 cycles */
>  		init->syt_offset = 3;
>  
> *	if ( (init->channel > 63) || (init->channel < 0) )
>  		init->channel = 63;
>  
>  	chan_mask = (u64)1 << init->channel;
> diff -u -p a/drivers/ieee1394/video1394.c b/drivers/ieee1394/video1394.c
> *** a/drivers/ieee1394/video1394.c 2008-03-12 14:13:13.000000000 +0100
> @@ -893,7 +893,7 @@ static long video1394_ioctl(struct file 
>  		if (unlikely(d = NULL))
>  			return -EFAULT;
>  
> *		if (unlikely((v.buffer<0) || (v.buffer>=d->num_desc - 1))) {
>  			PRINT(KERN_ERR, ohci->host->id,
>  			      "Buffer %d out of range",v.buffer);
>  			return -EINVAL;
> @@ -959,7 +959,7 @@ static long video1394_ioctl(struct file 
>  		if (unlikely(d = NULL))
>  			return -EFAULT;
>  
> *		if (unlikely((v.buffer<0) || (v.buffer>d->num_desc - 1))) {
>  			PRINT(KERN_ERR, ohci->host->id,
>  			      "Buffer %d out of range",v.buffer);
>  			return -EINVAL;
> @@ -1030,7 +1030,7 @@ static long video1394_ioctl(struct file 
>  		d = find_ctx(&ctx->context_list, OHCI_ISO_TRANSMIT, v.channel);
>  		if (d = NULL) return -EFAULT;
>  
> *		if ((v.buffer<0) || (v.buffer>=d->num_desc - 1)) {
>  			PRINT(KERN_ERR, ohci->host->id,
>  			      "Buffer %d out of range",v.buffer);
>  			return -EINVAL;
> @@ -1137,7 +1137,7 @@ static long video1394_ioctl(struct file 
>  		d = find_ctx(&ctx->context_list, OHCI_ISO_TRANSMIT, v.channel);
>  		if (d = NULL) return -EFAULT;
>  
> *		if ((v.buffer<0) || (v.buffer>=d->num_desc-1)) {
>  			PRINT(KERN_ERR, ohci->host->id,
>  			      "Buffer %d out of range",v.buffer);
>  			return -EINVAL;

I believe all these are essentially harmless.  Due to the wrapping
nature of unsigned arithmetic, while the first condition (x < 0) is
always false, the condition it's attempting to catch will be caught by
the second condition.  We should probably remove the tests for < 0.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
