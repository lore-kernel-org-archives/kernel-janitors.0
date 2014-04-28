From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Apr 2014 11:41:26 +0000
Subject: Re: [patch 2/2 v2] staging: lustre: integer overflow in obd_ioctl_is_invalid()
Message-Id: <20140428114126.GK4963@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140428105858.GA31925@mwanda>
 <535E3CF7.9030609@bfs.de>
In-Reply-To: <535E3CF7.9030609@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peng Tao <bergwolf@gmail.com>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>, "John L. Hammond" <john.hammond@intel.com>, Dmitry Eremin <dmitry.eremin@intel.com>, Jinshan Xiong <jinshan.xiong@intel.com>, Dulshani Gunawardhana <dulshani.gunawardhana89@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 28, 2014 at 01:35:19PM +0200, walter harms wrote:
> 
> 
> Am 28.04.2014 12:58, schrieb Dan Carpenter:
> > The obd_ioctl_getdata() function caps "data->ioc_len" at
> > OBD_MAX_IOCTL_BUFFER and then calls this obd_ioctl_is_invalid() to check
> > that the other values inside data are valid.
> > 
> > There are several lengths inside data but when they are added together
> > they must not be larger than "data->ioc_len".  The checks against
> > "(data->ioc_inllen1 > (1<<30))" are supposed to ensure that the addition
> > does not have an integer overflow.  But "(1<<30) * 4" actually can
> > overflow 32 bits, so the checks are insufficient.
> > 
> > I have changed it to "> OBD_MAX_IOCTL_BUFFER" instead.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Updated the error messages as Walter Harms pointed out.
> > 
> > diff --git a/drivers/staging/lustre/lustre/include/lustre_lib.h b/drivers/staging/lustre/lustre/include/lustre_lib.h
> > index bdc9812..3c26bbd 100644
> > --- a/drivers/staging/lustre/lustre/include/lustre_lib.h
> > +++ b/drivers/staging/lustre/lustre/include/lustre_lib.h
> > @@ -179,24 +179,25 @@ static inline int obd_ioctl_packlen(struct obd_ioctl_data *data)
> >  
> >  static inline int obd_ioctl_is_invalid(struct obd_ioctl_data *data)
> >  {
> > -	if (data->ioc_len > (1<<30)) {
> > -		CERROR("OBD ioctl: ioc_len larger than 1<<30\n");
> > +	if (data->ioc_len > OBD_MAX_IOCTL_BUFFER) {
> > +		CERROR("OBD ioctl: ioc_len larger than %d\n",
> > +		       OBD_MAX_IOCTL_BUFFER);
> >  		return 1;
> >  	}
> > -	if (data->ioc_inllen1 > (1<<30)) {
> > -		CERROR("OBD ioctl: ioc_inllen1 larger than 1<<30\n");
> > +	if (data->ioc_inllen1 > OBD_MAX_IOCTL_BUFFER) {
> > +		CERROR("OBD ioctl: ioc_inllen1 larger than ioc_len\n");
> >  		return 1;
> >  	}
> 
> The error mention ioc_len the compare is OBD_MAX_IOCTL_BUFFER ?
> Is that intentional ?

Yep.

regards,
dan carpenter

