From: Arnaldo Carvalho de Melo <acme@mandriva.com>
Date: Wed, 03 Jan 2007 11:37:55 +0000
Subject: Re: [KJ] [PATCH] kmalloc -> kzalloc conversion in Documentation
Message-Id: <20070103113755.GA3995@mandriva.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070102130813.GA7459@unknown-00-0d-60-79-ca-00.lan>
In-Reply-To: <20070102130813.GA7459@unknown-00-0d-60-79-ca-00.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 02, 2007 at 10:39:01AM -0500, Robert P. J. Day wrote:
> On Tue, 2 Jan 2007, Thomas Hisch wrote:
> 
> > On Tue, Jan 02, 2007 at 08:40:26AM -0500, Robert P. J. Day wrote:
> 
> > > >  	strncpy(fw_priv->fw_id, fw_name, FIRMWARE_NAME_MAX);
> > > >  	fw_priv->fw_id[FIRMWARE_NAME_MAX-1] = '\0';
> > > > @@ -180,7 +178,7 @@ static int __init firmware_sample_init(void)
> > > >  	int error;
> > > >
> > > >  	device_initialize(&my_device);
> > > > -	class_dev = kmalloc(sizeof(struct class_device), GFP_KERNEL);
> > > > +	class_dev = kzalloc(sizeof(struct class_device), GFP_KERNEL);
> > > >  	if(!class_dev)
> > > >  		return -ENOMEM;
> > >
> > > this also seems inappropriate.  the only kmalloc() calls that
> > > should be converted to kzalloc() calls are ones for which the
> > > allocated memory is set immediately to zero.  that's not what's
> > > happening here, so you should leave the original kmalloc() call as
> > > it is.
> >
> > what is the drawback of changing above kmalloc calls to kzalloc?
> 
> because you would be changing the actual logic of the code.  a
> kmalloc() followed by a memset() to zero can reasonably be replaced by
> a single kzalloc() call since it effectively doesn't change the code
> logic.
> 
> but replacing a kmalloc() by a kzalloc() definitely changes the
> underlying processing.  it *might* not cause any problem whatsoever,
> but that's not the point.  it simply doesn't represent the same code
> anymore, that's all.  not better, not worse -- just different.

Worse, as it consumes more processor cycles, if one is allocating a
struct and initializing explicitely all its fields or just don't care
about what is the initial values that comes in the area kmalloc'ed the
memset is just that, contributing to global warming 8-)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
