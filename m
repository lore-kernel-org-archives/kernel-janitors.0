From: Rusty Russell <rusty@rustcorp.com.au>
Date: Wed, 04 Jan 2012 02:44:55 +0000
Subject: Re: [patch] virtio_blk: lock() => unlock() typo in virtblk_config_changed_work()
Message-Id: <87wr98ci3s.fsf@rustcorp.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120103144513.GB21712@elgon.mountain>
	<20120103153127.GA8440@redhat.com>
In-Reply-To: <20120103153127.GA8440@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

On Tue, 3 Jan 2012 17:31:28 +0200, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Jan 03, 2012 at 05:45:13PM +0300, Dan Carpenter wrote:
> > This will deadlock.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > index f3d77b3..ba73661 100644
> > --- a/drivers/block/virtio_blk.c
> > +++ b/drivers/block/virtio_blk.c
> > @@ -352,7 +352,7 @@ static void virtblk_config_changed_work(struct work_struct *work)
> >  
> >  	set_capacity(vblk->disk, capacity);
> >  done:
> > -	mutex_lock(&vblk->config_lock);
> > +	mutex_unlock(&vblk->config_lock);
> >  }
> >  
> >  static void virtblk_config_changed(struct virtio_device *vdev)
> 
> Good catch.
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Indeed, I folded it into that patch.

Thanks!
Rusty.
