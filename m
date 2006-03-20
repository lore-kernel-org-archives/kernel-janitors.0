From: Greg KH <gregkh@suse.de>
Date: Mon, 20 Mar 2006 19:41:09 +0000
Subject: [KJ] Re: [PATCH] usb.h: reduce syslog clutter
Message-Id: <20060320194109.GA16890@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============053001621959829492=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============053001621959829492==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 18, 2006 at 08:53:26PM +0100, Tilman Schmidt wrote:
> The current versions of the err() / info() / warn() message macros in
> include/linux/usb.h insert __FILE__ at the beginning of the message.
> When those macros where introduced, back in 2.2 times, that expanded
> to the name of the source file, which was fine.
> 
> However, with the build process changes in 2.5, __FILE__ now expands
> to the complete path name of the source file within the kernel tree.
> Consequently, that part of the kernel message now takes up about half
> of an 80 character screen line.
> 
> The following patch modifies these macros so that, when used in a
> module, they'll insert the module name instead, which is significantly
> shorter and also tends to be more useful to users (as opposed to kernel
> developers) trying to make sense of a particular message.
> 
> It also adds a macro for the "notice" message level which was missing
> so far.
> 
> The triple checks for defined(CONFIG_MODULES), defined(THIS_MODULE)
> and THIS_MODULE are necessary to catch all possible combinations of
> - kernel being built with or without module support
> - source file #including linux/usb.h or not
> - source file actually being built as a module or not

What was wrong with my suggestion that we simply delete these macros and
convert the USB code over to using the proper dev_info(), dev_warn(),
dev_err(), and dev_notice() macros instead?

These really should not be propagated any further.

thanks,

greg k-h

--===============053001621959829492==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============053001621959829492==--
