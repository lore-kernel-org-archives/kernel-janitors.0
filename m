From: Greg KH <gregkh@suse.de>
Date: Tue, 28 Jul 2009 15:13:09 +0000
Subject: Re: [PATCH] Staging: hv: Transform PDEVICE_OBJECT and
Message-Id: <20090728151309.GA14956@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907281030.45317.npalix@diku.dk>
 <20090728144123.GB13883@suse.de>
 <200907281701.43509.npalix@diku.dk>
 <20090728150716.GH3711@parisc-linux.org>
In-Reply-To: <20090728150716.GH3711@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Nicolas Palix <npalix@diku.dk>, hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 28, 2009 at 09:07:16AM -0600, Matthew Wilcox wrote:
> On Tue, Jul 28, 2009 at 05:01:42PM +0200, Nicolas Palix wrote:
> > Ok. So, I guess the pattern for the other typedef is to strip the _OBJECT
> > suffix when present, and always add the prefix hv_, right ?
> 
> The 'pattern' is to look at what the code is doing and choose a sensible
> name.

Heh, yes.  It can be hard, I know I suck at picking names for structures
and functions at times, but try to make it unique and descriptive for
what it is doing.

thanks,

greg "struct class" k-h
