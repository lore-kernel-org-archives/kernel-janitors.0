From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Fri, 11 Feb 2005 00:32:57 +0000
Subject: Re: [KJ] [PATCH][17/26] drivers/usb/class/* - compile warning cleanup
Message-Id: <420C1959.2360.FBD54C@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88678589794133744=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <420BEF84.30631.5873DC@localhost>
In-Reply-To: <420BEF84.30631.5873DC@localhost>
To: kernel-janitors@vger.kernel.org

--===============88678589794133744==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 10 Feb 2005 at 14:15, Greg KH wrote:

> On Thu, Feb 10, 2005 at 11:34:28PM +0200, Stephen Biggs wrote:
> Content-Description: Mail message body
> > Description: add MODULE definition compile fence so MODULE_DEVICE_TABLE 
> > vars not declared when compiled into the kernel
> > 
> > Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>
> > 
> > diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/drivers/usb/class/usb-midi.h linux-2.6.11-rc3-mm/drivers/usb/class/usb-midi.h
> > --- linux-2.6.11-rc3-mm-original/drivers/usb/class/usb-midi.h	2005-02-03 03:56:10.000000000 +0200
> > +++ linux-2.6.11-rc3-mm/drivers/usb/class/usb-midi.h	2005-02-07 21:19:25.000000000 +0200
> > @@ -139,6 +139,7 @@ static struct usb_midi_device usb_midi_d
> >  
> >  #define VENDOR_SPECIFIC_USB_MIDI_DEVICES (sizeof(usb_midi_devices)/sizeof(struct usb_midi_device))
> >  
> > +#ifdef MODULE
> >  /* for Hot-Plugging */
> >  
> >  static struct usb_device_id usb_midi_ids [] = {
> > @@ -157,6 +158,7 @@ static struct usb_device_id usb_midi_ids
> >  };
> >  
> >  MODULE_DEVICE_TABLE (usb, usb_midi_ids);
> > +#endif /* MODULE */
> 
> No, these types of "fixes" have been rejected many times in the past,
> and will be rejected again...  It's just not worth it.

Ok, I'm in this to learn... can you provide a link to some discussion 
where this is talked about in the context of a rejected patch?  What is a 
better solution to this?  I thought this was the cleanest way to do this. 

Why is this a "fix" to you (in quotation marks)?  If the driver is 
compiled as a module, then this table is used, but if it is compiled into 
the kernel, it doesn't need the table... this is more of a module 
interface design issue in the kernel than it is about a fix that takes 
care of the problem.

Please advise, or if you don't want to rehash something, please point me 
to some sort of discussion somewhere else, if you can.

> 
> thanks,
> 
> greg k-h
> 




--===============88678589794133744==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88678589794133744==--
