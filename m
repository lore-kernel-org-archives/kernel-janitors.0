From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 23:23:41 +0000
Subject: Re: [KJ] [PATCH][18/26] drivers/usb/image/* - compile warning cleanup
Message-Id: <420C091D.29724.BC6A50@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87395976539036035=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420BEF84.5020.58734F@localhost>
In-Reply-To: <420BEF84.5020.58734F@localhost>
To: kernel-janitors@vger.kernel.org

--===============87395976539036035==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 11 Feb 2005 at 1:27, Alexey Dobriyan wrote:

> On Thursday 10 February 2005 23:34, Stephen Biggs wrote:
> 
> > --- linux-2.6.11-rc3-mm-original/drivers/usb/image/microtek.c
> > +++ linux-2.6.11-rc3-mm/drivers/usb/image/microtek.c
> > @@ -809,7 +809,11 @@ static int mts_usb_probe(struct usb_inte
> >  		goto out_free_urb;
> >  
> >  	new_desc->host->hostdata[0] = (unsigned long)new_desc;
> > -	scsi_add_host(new_desc->host, NULL); /* XXX handle failure */
> > +	if(scsi_add_host(new_desc->host, NULL)) {
> > +		usb_free_urb(new_desc->urb);
> > +		kfree(new_desc);
> > +		return -EIO;
> > +	}
> 
> Should be:
> 
> 	if (scsi_add_host(new_desc->host, NULL)) {
> 		rc = -E____;
> 		goto out_free_urb;
> 	}
> 
> Yes, yes, I know. There is no rc in mts_usb_probe. ;-)

This is why I didn't do it your way.  I made the judgement call of not 
adding another patch line and an rc variable that would either only be 
used in one place, or I would have change the entire function to use 
"rc" consistently.  My patch is, instead, a deletion of one line and an 
addition of 5 lines all in one place; simple.

Thanks for the feedback.

> 
> 	Alexey
> 




--===============87395976539036035==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87395976539036035==--
