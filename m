From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Apr 2019 07:31:26 +0000
Subject: Re: [PATCH] block: make blk_queue_zone_sectors() return sector_t type
Message-Id: <20190410073126.GP6070@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190410061006.GA18813@kadam>
 <BYAPR04MB5816CFE5C37FABB137D496DEE72E0@BYAPR04MB5816.namprd04.prod.outlook.com>
In-Reply-To: <BYAPR04MB5816CFE5C37FABB137D496DEE72E0@BYAPR04MB5816.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.com>, Omar Sandoval <osandov@fb.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bart Van Assche <bvanassche@acm.org>, Ming Lei <ming.lei@redhat.com>, Greg Edwards <gedwards@ddn.com>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Apr 10, 2019 at 07:20:27AM +0000, Damien Le Moal wrote:
> On 2019/04/10 15:10, Dan Carpenter wrote:
> > My static checker complains about this line from dmz_get_zoned_device()
> > 
> > 	aligned_capacity = dev->capacity & ~(blk_queue_zone_sectors(q) - 1);
> > 
> > The problem is that "aligned_capacity" and "dev->capacity" are sector_t
> > type (which is a u64) but blk_queue_zone_sectors(q) returns a u32 so the
> > higher 32 bits in aligned_capacity are always cleared to zero.
> > 
> > Declaring blk_queue_zone_sectors() as a sector_t addresses this warning
> > and it feels intuitive based on the function name.  I updated
> > bdev_zone_sectors() as well just to be consistent.
> > 
> > Fixes: 114e025968b5 ("dm zoned: ignore last smaller runt zone")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Please review this one extra carefully.  I'm not positive it's correct.
> > 
> >  include/linux/blkdev.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > index 4b85dc066264..1785a7f506be 100644
> > --- a/include/linux/blkdev.h
> > +++ b/include/linux/blkdev.h
> > @@ -670,7 +670,7 @@ static inline bool blk_queue_is_zoned(struct request_queue *q)
> >  	}
> >  }
> >  
> > -static inline unsigned int blk_queue_zone_sectors(struct request_queue *q)
> > +static inline sector_t blk_queue_zone_sectors(struct request_queue *q)
> >  {
> >  	return blk_queue_is_zoned(q) ? q->limits.chunk_sectors : 0;
> >  }
> > @@ -1419,7 +1419,7 @@ static inline bool bdev_is_zoned(struct block_device *bdev)
> >  	return false;
> >  }
> >  
> > -static inline unsigned int bdev_zone_sectors(struct block_device *bdev)
> > +static inline sector_t bdev_zone_sectors(struct block_device *bdev)
> >  {
> >  	struct request_queue *q = bdev_get_queue(bdev);
> 
> Indeed, using sector_t instead of unsigned int is more intuitive and changing to
> sector_t matches the 64bits zone length in struct blk_zone too, so no problem on
> this front.
> 
> However, q->limits.chunk_sectors is an unsigned int, which is why I used that
> type, to reflect the fact that even though the API allows values larger than 4G
> sectors, the handling through the queue limits truncates that to at most 4G-1
> sectors. Furthermore, the unsigned int type is used wherever
> blk_queue_zone_sectors() and bdev_zone_sectors() are called (block/ioctl.c,
> block/blk-zoned.c, f2fs, etc). That needs in depth checking.
> 
> I would rather keep the unsigned int since the queue limits will give only 32
> bit values anyway. What about a cast for the aligned capacity line ? Something like:
> 
> aligned_capacity = dev->capacity & ~((u64)blk_queue_zone_sectors(q) - 1);
> 
> Would that make your checker happy ?
> 

Yeah.  Or a sector_t cast.

	aligned_capacity = dev->capacity & ~((sector_t)blk_queue_zone_sectors(q) - 1);

regards,
dan carpenter
