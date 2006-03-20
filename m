From: Greg KH <gregkh@suse.de>
Date: Mon, 20 Mar 2006 20:39:51 +0000
Subject: [KJ] Re: [PATCH] usb.h: reduce syslog clutter
Message-Id: <20060320203951.GA19025@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============099347105454331341=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060320194109.GA16890@suse.de>
In-Reply-To: <20060320194109.GA16890@suse.de>
To: kernel-janitors@vger.kernel.org

--===============099347105454331341==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 20, 2006 at 09:00:11PM +0100, Tilman Schmidt wrote:
> On 20.03.2006 20:41, Greg KH wrote:
> 
> > On Sat, Mar 18, 2006 at 08:53:26PM +0100, Tilman Schmidt wrote:
> > 
> >>The current versions of the err() / info() / warn() message macros in
> >>include/linux/usb.h insert __FILE__ at the beginning of the message.
> >>[...]
> >>The following patch modifies these macros so that, when used in a
> >>module, they'll insert the module name instead, which is significantly
> >>shorter and also tends to be more useful to users (as opposed to kernel
> >>developers) trying to make sense of a particular message.
> >>
> >>It also adds a macro for the "notice" message level which was missing
> >>so far.
> >[...]
> > What was wrong with my suggestion that we simply delete these macros and
> > convert the USB code over to using the proper dev_info(), dev_warn(),
> > dev_err(), and dev_notice() macros instead?
> 
> Just that, as you remarked yourself:
> 
> > [T]here are a few places in the USB code that do
> > not have a valid device and so they can't be dropped entirely.
> 
> and I still don't see how to handle that situation with the dev_ macros.
> 
> But I thought you said you would accept that patch if I submitted it
> through the kernel-janitors. Why the change of mind?

No, I think you misunderstood me.  I said that converting the USB code
over to using the proper dev_* macros would be a good janitor's project,
not that you need to submit this patch through them.

There are only a very few places that these macros can not be used, and
only after converting everything that can possibly be changed, then we
can see if these are still really needed or not.

thanks,

greg k-h

--===============099347105454331341==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============099347105454331341==--
