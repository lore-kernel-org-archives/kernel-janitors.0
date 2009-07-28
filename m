From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2009 15:18:31 +0000
Subject: Re: [PATCH] Staging: hv: Transform PDEVICE_OBJECT
Message-Id: <200907281718.31681.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907281030.45317.npalix@diku.dk> <200907281701.43509.npalix@diku.dk> <20090728150716.GH3711@parisc-linux.org>
In-Reply-To: <20090728150716.GH3711@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Nicolas Palix <npalix@diku.dk>, Greg KH <gregkh@suse.de>, hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 28 July 2009, Matthew Wilcox wrote:
> On Tue, Jul 28, 2009 at 05:01:42PM +0200, Nicolas Palix wrote:
> > Ok. So, I guess the pattern for the other typedef is to strip the _OBJECT
> > suffix when present, and always add the prefix hv_, right ?
> 
> The 'pattern' is to look at what the code is doing and choose a sensible
> name.

I took a closer look at how this is used and noticed that there
is both the DEVICE_OBJECT typedef and struct device_context.
While I don't understand the reason for the split, my feeling
is that the contents of DEVICE_OBJECT should really be moved into
device_context and that one be renamed to hv_device.

	Arnd <><
