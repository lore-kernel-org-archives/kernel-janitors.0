From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 14 Jul 2010 19:05:38 +0000
Subject: Re: [PATCH] scsi: dpt_i2o: fix memory leak
Message-Id: <20100714190538.GA4616@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279130008-9934-1-git-send-email-segooon@gmail.com>
 <20100714185831.GA5164@bicker>
In-Reply-To: <20100714185831.GA5164@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, Adaptec OEM Raid Solutions <aacraid@adaptec.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>Julia Lawall <j>

On Wed, Jul 14, 2010 at 20:58 +0200, Dan Carpenter wrote:
> On Wed, Jul 14, 2010 at 09:53:27PM +0400, Kulikov Vasiliy wrote:
> > Free allocated memory if adpt_ioctl_to_context() failed.
> > 
> > Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> > ---
> >  drivers/scsi/dpt_i2o.c |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> > 
> > diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
> > index f2d4df1..dd9a43b 100644
> > --- a/drivers/scsi/dpt_i2o.c
> > +++ b/drivers/scsi/dpt_i2o.c
> > @@ -1839,8 +1839,10 @@ static int adpt_i2o_passthru(adpt_hba* pHba, u32 __user *arg)
> >  	sg_offset = (msg[0]>>4)&0xf;
> >  	msg[2] = 0x40000000; // IOCTL context
> >  	msg[3] = adpt_ioctl_to_context(pHba, reply);
> 
> This patch is wrong I'm afraid.  adpt_ioctl_to_context() frees "reply" if
> there is an error.
Hmm right, but it is very strange coding style - function frees resources
that it did not allocated on error and does not free them on success.

Please, ignore this patch. Sorry for the noise.
