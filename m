From: David Airlie <airlied@redhat.com>
Date: Thu, 08 Dec 2011 16:58:37 +0000
Subject: Re: [patch] drm/ttm: fix condition (and vs or)
Message-Id: <12fafb70-a5c5-4a5e-b543-78d06c4cb33d@zmail16.collab.prod.int.phx2.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111208165334.GB21823@phenom.dumpdata.com>
In-Reply-To: <20111208165334.GB21823@phenom.dumpdata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>



----- Original Message -----
> From: "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>
> To: "Jerome Glisse" <j.glisse@gmail.com>
> Cc: dri-devel@lists.freedesktop.org, "Jerome Glisse" <jglisse@redhat.com>, kernel-janitors@vger.kernel.org, "Thomas
> Hellstrom" <thellstrom@vmware.com>, "Dan Carpenter" <dan.carpenter@oracle.com>
> Sent: Thursday, 8 December, 2011 4:53:34 PM
> Subject: Re: [patch] drm/ttm: fix condition (and vs or)
> 
> On Thu, Dec 08, 2011 at 10:34:00AM -0500, Jerome Glisse wrote:
> > On Thu, Dec 08, 2011 at 09:50:54AM +0300, Dan Carpenter wrote:
> > > The "if (!p && !p->dev)" condition isn't right because || was
> > > intended
> > > instead of &&.  But actually, "p" is the list cursor and so it's
> > > always
> 
> Duh!
> > > non-NULL and we can just remove that bit.  We can remove the
> > > another
> > > similar check as well.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Jerome Glisse <jglisse@redhat.com>
> 
> And Acked-by me.
> 
> Jerome, since you have the patches (And are thinking to send a GIT
> PULL
> to Dave) in your tree, could you include this patch in your queue?
> 

I've taken the TTM changes into drm-next already, just reviewing the radeon stuff.

But if that appeared on top in Jerome's tree I can steal it.

Dave.
