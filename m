From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Sat, 05 Mar 2005 09:33:37 +0000
Subject: Re: [KJ] compile warnings due to change of pci resource element type
Message-Id: <42299911.9515.F6BB1@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89953626474843285=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42287935.30573.366952@localhost>
In-Reply-To: <42287935.30573.366952@localhost>
To: kernel-janitors@vger.kernel.org

--===============89953626474843285==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 4 Mar 2005 at 8:57, Greg KH wrote:

> On Fri, Mar 04, 2005 at 07:49:45AM -0800, Randy.Dunlap wrote:
> > Stephen Biggs wrote:
> > >Trying to comple the latest version (2.6.11-rc5-mm1) gives a huge amount 
> > >of warnings in a lot of files due to printf formats (and a couple of 
> > >other minor issues) that have %lx instead of %llx for the "start" element 
> > >in the pci_resource struct whose type was changed from u32 to u64.
> > >
> > >These are relatively easy to fix and need to be fixed because of 
> > >potential stack issues with var arg functions like printk and friends.
> > >
> > >My question is: should I do this or is someone else working on this, 
> > >perhaps a better fix than simply changing the majority of occurrences of 
> > >"%lx" to "%llx"?
> > 
> > I read messages on lkml that the pci resource patch was being dropped
> > temporarily to fix some issues.... Perhaps its patch submitter will
> > be fixing those, I dunno.
> 
> Odds are, it will be me :(
> 
> So yes, I will gladly take those kinds of patches.

Yes, OK, I'll start working on it soon.

Quick question: I see these problems on 2.6.11-rc5-mm1 but NOT on the 
mainline kernel of 2.6.11.  Also, see my previous email about 2.6.11-kj 
patch not applying cleanly at all to the rc5-mm1 BUT applies perfectly to 
the mainline 2.6.11.

Which kernel version should I be working with?  Since there is now a 
release of 2.6.11, isn't the proper version for us now 2.6.12-rc1, as 
soon as it's created??

I am confused.

>  But you need to convert: 
> 	"%lx", resource_variable
>  to:
> 	"%llx", (unsigned long long)resource_variable
> 
> to make it work on all platforms.

Shouldn't it be (u64) instead of (unsigned long long)?  

> 
> thanks,
> 
> greg k-h
> 




--===============89953626474843285==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89953626474843285==--
