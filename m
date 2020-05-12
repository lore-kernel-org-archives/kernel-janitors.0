From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 May 2020 08:17:06 +0000
Subject: Re: [PATCH] RDMA/rxe: Return -EFAULT if copy_from_user() fails
Message-Id: <20200512081706.GJ9365@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200511183742.GB225608@mwanda>
 <20200512062936.GE4814@unreal>
 <20200512070203.GG4814@unreal>
In-Reply-To: <20200512070203.GG4814@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon@kernel.org>
Cc: Zhu Yanjun <yanjunz@mellanox.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 12, 2020 at 10:02:03AM +0300, Leon Romanovsky wrote:
> On Tue, May 12, 2020 at 09:29:36AM +0300, Leon Romanovsky wrote:
> > On Mon, May 11, 2020 at 09:37:42PM +0300, Dan Carpenter wrote:
> > > This function used to always return -EINVAL but we updated it to try
> > > preserve the error codes.  Unfortunately the copy_to_user() is returning
> > > the number of bytes remaining to be copied instead of a negative error
> > > code.
> > >
> > > Fixes: a3a974b4654d ("RDMA/rxe: Always return ERR_PTR from rxe_create_mmap_info()")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > >  drivers/infiniband/sw/rxe/rxe_queue.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> >
> > Thanks,
> > Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
> 
> Actually Yanjun is right and "err" can be removed.
> 
> Thanks

I don't know if the code you guys are looking at is older or newer than
linux-next...  :P

drivers/infiniband/sw/rxe/rxe_queue.c
    39  int do_mmap_info(struct rxe_dev *rxe, struct mminfo __user *outbuf,
    40                   struct ib_udata *udata, struct rxe_queue_buf *buf,
    41                   size_t buf_size, struct rxe_mmap_info **ip_p)
    42  {
    43          int err;
                    ^^^

    44          struct rxe_mmap_info *ip = NULL;
    45  
    46          if (outbuf) {
    47                  ip = rxe_create_mmap_info(rxe, buf_size, udata, buf);
    48                  if (IS_ERR(ip)) {
    49                          err = PTR_ERR(ip);
    50                          goto err1;
                                ^^^^^^^^^
    51                  }
    52  
    53                  err = copy_to_user(outbuf, &ip->info, sizeof(ip->info));
    54                  if (err)
    55                          goto err2;
                                ^^^^^^^^^
    56  
    57                  spin_lock_bh(&rxe->pending_lock);
    58                  list_add(&ip->pending_mmaps, &rxe->pending_mmaps);
    59                  spin_unlock_bh(&rxe->pending_lock);
    60          }
    61  
    62          *ip_p = ip;
    63  
    64          return 0;
    65  
    66  err2:
    67          kfree(ip);
    68  err1:
    69          return err;
                       ^^^
    70  }

regards,
dan carpenter
