From: Thomas Hisch <t.hisch@gmail.com>
Date: Tue, 02 Jan 2007 14:17:28 +0000
Subject: Re: [KJ] [PATCH] kmalloc -> kzalloc conversion in Documentation
Message-Id: <20070102141728.GA7987@unknown-00-0d-60-79-ca-00.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070102130813.GA7459@unknown-00-0d-60-79-ca-00.lan>
In-Reply-To: <20070102130813.GA7459@unknown-00-0d-60-79-ca-00.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 02, 2007 at 08:40:26AM -0500, Robert P. J. Day wrote:
> On Tue, 2 Jan 2007, Thomas Hisch wrote:
> 
> > diff --git a/Documentation/firmware_class/firmware_sample_firmware_class.c b/Documentation/firmware_class/firmware_sample_firmware_class.c
> > index 9e1b0e4..da888f0 100644
> > --- a/Documentation/firmware_class/firmware_sample_firmware_class.c
> > +++ b/Documentation/firmware_class/firmware_sample_firmware_class.c
> > @@ -108,15 +108,13 @@ static int fw_setup_class_device(struct class_device *class_dev,
> >  				 struct device *device)
> >  {
> >  	int retval = 0;
> > -	struct firmware_priv *fw_priv = kmalloc(sizeof(struct firmware_priv),
> > +	struct firmware_priv *fw_priv = kzalloc(sizeof(struct firmware_priv),
> >  						GFP_KERNEL);
> >
> >  	if(!fw_priv){
> >  		retval = -ENOMEM;
> >  		goto out;
> >  	}
> > -	memset(fw_priv, 0, sizeof(*fw_priv));
> > -	memset(class_dev, 0, sizeof(*class_dev));
> 
> i don't think you can remove this second memset() call.  it represents
> an argument to this routine, and there's nothing about that kzalloc()
> call that lets you skip that step.  (that first memset() call is, of
> course, fine.)
> 
> >  	strncpy(fw_priv->fw_id, fw_name, FIRMWARE_NAME_MAX);
> >  	fw_priv->fw_id[FIRMWARE_NAME_MAX-1] = '\0';
> > @@ -180,7 +178,7 @@ static int __init firmware_sample_init(void)
> >  	int error;
> >
> >  	device_initialize(&my_device);
> > -	class_dev = kmalloc(sizeof(struct class_device), GFP_KERNEL);
> > +	class_dev = kzalloc(sizeof(struct class_device), GFP_KERNEL);
> >  	if(!class_dev)
> >  		return -ENOMEM;
> 
> this also seems inappropriate.  the only kmalloc() calls that should
> be converted to kzalloc() calls are ones for which the allocated
> memory is set immediately to zero.  that's not what's happening here,
> so you should leave the original kmalloc() call as it is.
> 

what is the drawback of changing above kmalloc calls to kzalloc?

nevertheless i'll will drop this inappropriate kzalloc part from the patch. 

-- 
Thomas Hisch
e0625874@stud.tuwien.ac.at
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
