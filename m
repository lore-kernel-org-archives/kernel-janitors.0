From: Greg KH <greg@kroah.com>
Date: Wed, 22 Mar 2006 20:56:15 +0000
Subject: Re: [KJ] Re: [PATCH] usb.h: reduce syslog clutter
Message-Id: <20060322205615.GG12335@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6275209569864254=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060320194109.GA16890@suse.de>
In-Reply-To: <20060320194109.GA16890@suse.de>
To: kernel-janitors@vger.kernel.org

--===============6275209569864254==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 21, 2006 at 01:56:37AM +0100, Tilman Schmidt wrote:
> On 20.03.2006 21:39, Greg KH wrote:
> > On Mon, Mar 20, 2006 at 09:00:11PM +0100, Tilman Schmidt wrote:
> > 
> >>On 20.03.2006 20:41, Greg KH wrote:
> >>
> >>
> >>>On Sat, Mar 18, 2006 at 08:53:26PM +0100, Tilman Schmidt wrote:
> >>>
> >>>
> >>>>The current versions of the err() / info() / warn() message macros in
> >>>>include/linux/usb.h insert __FILE__ at the beginning of the message.
> >>>>[...]
> >>>>The following patch modifies these macros so that, when used in a
> >>>>module, they'll insert the module name instead, which is significantly
> >>>>shorter and also tends to be more useful to users (as opposed to kernel
> >>>>developers) trying to make sense of a particular message.
> >>>>
> >>>>It also adds a macro for the "notice" message level which was missing
> >>>>so far.
> >>>
> >>>[...]
> >>>What was wrong with my suggestion that we simply delete these macros and
> >>>convert the USB code over to using the proper dev_info(), dev_warn(),
> >>>dev_err(), and dev_notice() macros instead?
> >>
> >>Just that, as you remarked yourself:
> >>
> >>
> >>>[T]here are a few places in the USB code that do
> >>>not have a valid device and so they can't be dropped entirely.
> >>
> >>and I still don't see how to handle that situation with the dev_ macros.
> >>
> >>But I thought you said you would accept that patch if I submitted it
> >>through the kernel-janitors. Why the change of mind?
> > 
> > No, I think you misunderstood me.  I said that converting the USB code
> > over to using the proper dev_* macros would be a good janitor's project,
> > not that you need to submit this patch through them.
> > 
> > There are only a very few places that these macros can not be used, and
> > only after converting everything that can possibly be changed, then we
> > can see if these are still really needed or not.
> 
> Greg, as you may remember, Hansj?rg and I are trying to submit an
> existing, working driver for inclusion in the main kernel tree. That
> driver does have quite a few places where it must emit a message without
> reliably having access to a valid device structure. The janitors can't
> convert that for us because it is not part of the tree yet;

And those places should be _very_ few.  In fact so few I would argue
that they are probably not needed at all :)

Please post your code and we can discuss it then.

> it can't become part of the tree because it uses those macros you say
> shouldn't be propagated any further; I can't convert it myself because
> I don't know how, and when I ask you you only tell me not to worry.
> Catch-22.

This simple header file change should not depend on your driver
submission at all.

> What harm does it do to fix those macros now when they are needed in
> existing code, even if they might disappear sometime in kernel 2.6.21 or
> so? Does it justify blocking the inclusion of a driver in the tree?

Not at all, you haven't submitted your driver to be blocked yet :)

> Fourteen months ago you told me there were no valid reasons for not
> including a USB driver in the main kernel tree. Have we hit upon such a
> reason after all?

No, again, not at all.

thanks,

greg k-h

--===============6275209569864254==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6275209569864254==--
