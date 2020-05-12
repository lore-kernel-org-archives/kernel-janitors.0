From: Leon Romanovsky <leon@kernel.org>
Date: Tue, 12 May 2020 08:31:07 +0000
Subject: Re: [PATCH] RDMA/rxe: Return -EFAULT if copy_from_user() fails
Message-Id: <20200512083107.GI4814@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200511183742.GB225608@mwanda>
 <20200512062936.GE4814@unreal>
 <20200512070203.GG4814@unreal>
 <20200512081706.GJ9365@kadam>
In-Reply-To: <20200512081706.GJ9365@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Zhu Yanjun <yanjunz@mellanox.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 12, 2020 at 11:17:06AM +0300, Dan Carpenter wrote:
> On Tue, May 12, 2020 at 10:02:03AM +0300, Leon Romanovsky wrote:
> > On Tue, May 12, 2020 at 09:29:36AM +0300, Leon Romanovsky wrote:
> > > On Mon, May 11, 2020 at 09:37:42PM +0300, Dan Carpenter wrote:
> > > > This function used to always return -EINVAL but we updated it to try
> > > > preserve the error codes.  Unfortunately the copy_to_user() is returning
> > > > the number of bytes remaining to be copied instead of a negative error
> > > > code.
> > > >
> > > > Fixes: a3a974b4654d ("RDMA/rxe: Always return ERR_PTR from rxe_create_mmap_info()")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > >  drivers/infiniband/sw/rxe/rxe_queue.c | 5 +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > >
> > > Thanks,
> > > Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
> >
> > Actually Yanjun is right and "err" can be removed.
> >
> > Thanks
>
> I don't know if the code you guys are looking at is older or newer than
> linux-next...  :P

We both looked on rdma-next, but the wrong code was added to -rc.

Jason, that patch was marked as stable@.

Thanks
