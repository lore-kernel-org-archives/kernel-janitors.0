From: Greg KH <gregkh@suse.de>
Date: Tue, 31 Oct 2006 18:23:55 +0000
Subject: Re: [KJ] [PATCH] driver core: handle ignored error codes,
Message-Id: <20061031182355.GB13720@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061027184103.GB26056@silverwood.ncultra.org>
In-Reply-To: <20061027184103.GB26056@silverwood.ncultra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 31, 2006 at 10:57:36AM -0600, Steve Fox wrote:
> On Fri, 2006-10-27 at 14:41 -0400, Mike D. Day wrote:
> >  	if ((error = device_pm_add(dev)))
> > -		goto PMError;
> > +		goto pme_rror;
> [snip]
> > - PMError:
> > +pme_rror:
> >  	device_remove_groups(dev);
> 
> Shouldn't these be pm_error?

Heh, yes, care to make a patch?

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
