From: Greg KH <greg@kroah.com>
Date: Fri, 11 Feb 2005 00:47:00 +0000
Subject: Re: [KJ] [PATCH][17/26] drivers/usb/class/* - compile warning cleanup
Message-Id: <20050211004700.GA26865@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84669285960174934=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420BEF84.30631.5873DC@localhost>
In-Reply-To: <420BEF84.30631.5873DC@localhost>
To: kernel-janitors@vger.kernel.org

--===============84669285960174934==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2005 at 02:32:57AM +0200, Stephen Biggs wrote:
> On 10 Feb 2005 at 14:15, Greg KH wrote:
> 
> > On Thu, Feb 10, 2005 at 11:34:28PM +0200, Stephen Biggs wrote:
> > Content-Description: Mail message body
> > > Description: add MODULE definition compile fence so MODULE_DEVICE_TABLE 
> > > vars not declared when compiled into the kernel
> > > 
> > > Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>
> > > 
> > > diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/usb/class/usb-midi.h linux-2.6.11-rc3-mm/drivers/usb/class/usb-midi.h
> > > --- linux-2.6.11-rc3-mm-original/drivers/usb/class/usb-midi.h	2005-02-03 03:56:10.000000000 +0200
> > > +++ linux-2.6.11-rc3-mm/drivers/usb/class/usb-midi.h	2005-02-07 21:19:25.000000000 +0200
> > > @@ -139,6 +139,7 @@ static struct usb_midi_device usb_midi_d
> > >  
> > >  #define VENDOR_SPECIFIC_USB_MIDI_DEVICES (sizeof(usb_midi_devices)/sizeof(struct usb_midi_device))
> > >  
> > > +#ifdef MODULE
> > >  /* for Hot-Plugging */
> > >  
> > >  static struct usb_device_id usb_midi_ids [] = {
> > > @@ -157,6 +158,7 @@ static struct usb_device_id usb_midi_ids
> > >  };
> > >  
> > >  MODULE_DEVICE_TABLE (usb, usb_midi_ids);
> > > +#endif /* MODULE */
> > 
> > No, these types of "fixes" have been rejected many times in the past,
> > and will be rejected again...  It's just not worth it.
> 
> Ok, I'm in this to learn... can you provide a link to some discussion 
> where this is talked about in the context of a rejected patch?  What is a 
> better solution to this?  I thought this was the cleanest way to do this. 

I can't think of the exact link, but this has come up every so often
over the past 4 years on the linux-kernel mailing list.

> Why is this a "fix" to you (in quotation marks)?  If the driver is 
> compiled as a module, then this table is used, but if it is compiled into 
> the kernel, it doesn't need the table... this is more of a module 
> interface design issue in the kernel than it is about a fix that takes 
> care of the problem.

It's not good to put #ifdefs in .c files.  And to do this, just for the
one odd person that does not build with modules enabled, and do it for
every driver in the system, is not a valid idea.  A better idea would be
to fix the MODULE_DEVICE_TABLE() macro to be marked __unused__ or
something, so the compiler warning will not happen.  That way one fix
solves it for everyone.

good luck,

greg k-h

--===============84669285960174934==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84669285960174934==--
