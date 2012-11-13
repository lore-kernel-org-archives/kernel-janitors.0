From: Rafael Aquini <aquini@redhat.com>
Date: Tue, 13 Nov 2012 14:28:22 +0000
Subject: Re: [patch] virtio_balloon: unlock on error in fill_balloon()
Message-Id: <20121113142821.GB1636@optiplex.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121113074303.GA13198@elgon.mountain>
In-Reply-To: <20121113074303.GA13198@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>

On Tue, Nov 13, 2012 at 10:43:03AM +0300, Dan Carpenter wrote:
> We recently added locking in fill_balloon() but there was one error path
> which was missed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Only needed in linux-next.
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index f70151b..1c50e98 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -153,9 +153,10 @@ static void fill_balloon(struct virtio_balloon *vb, size_t num)
>  
>  	/* Didn't get any?  Oh well. */
>  	if (vb->num_pfns = 0)
> -		return;
> +		goto unlock;
>  
>  	tell_host(vb, vb->inflate_vq);
> +unlock:
>  	mutex_unlock(&vb->balloon_lock);
>  }
>
Thanks for the catch Dan. 

Andrew has already picked a slightly different (and simpler) fix for this one,
though.

---8<---
a/drivers/virtio/virtio_balloon.c~virtio_balloon-introduce-migration-primitives-to-balloon-pages-fix-fix
+++ a/drivers/virtio/virtio_balloon.c
@@ -151,13 +151,9 @@ static void fill_balloon(struct virtio_b
                totalram_pages--;
       	}

-	/* Didn't get any?  Oh well. */
-	if (vb->num_pfns = 0) {
-               mutex_unlock(&vb->balloon_lock);
-               return;
-	}
-
-	tell_host(vb, vb->inflate_vq);
+	/* Did we get any? */
+	if (vb->num_pfns != 0)
+               tell_host(vb, vb->inflate_vq);
        mutex_unlock(&vb->balloon_lock);
 }
---8<---
