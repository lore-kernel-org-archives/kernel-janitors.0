From: Greg KH <greg@kroah.com>
Date: Fri, 04 Mar 2005 16:57:55 +0000
Subject: Re: [KJ] compile warnings due to change of pci resource element type
Message-Id: <20050304165755.GF28179@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71013691307283144=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42287935.30573.366952@localhost>
In-Reply-To: <42287935.30573.366952@localhost>
To: kernel-janitors@vger.kernel.org

--===============71013691307283144==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 04, 2005 at 07:49:45AM -0800, Randy.Dunlap wrote:
> Stephen Biggs wrote:
> >Trying to comple the latest version (2.6.11-rc5-mm1) gives a huge amount 
> >of warnings in a lot of files due to printf formats (and a couple of 
> >other minor issues) that have %lx instead of %llx for the "start" element 
> >in the pci_resource struct whose type was changed from u32 to u64.
> >
> >These are relatively easy to fix and need to be fixed because of 
> >potential stack issues with var arg functions like printk and friends.
> >
> >My question is: should I do this or is someone else working on this, 
> >perhaps a better fix than simply changing the majority of occurrences of 
> >"%lx" to "%llx"?
> 
> I read messages on lkml that the pci resource patch was being dropped
> temporarily to fix some issues.... Perhaps its patch submitter will
> be fixing those, I dunno.

Odds are, it will be me :(

So yes, I will gladly take those kinds of patches.  But you need to
convert:
	"%lx", resource_variable
 to:
	"%llx", (unsigned long long)resource_variable

to make it work on all platforms.

thanks,

greg k-h

--===============71013691307283144==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71013691307283144==--
