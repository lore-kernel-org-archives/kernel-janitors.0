From: Greg KH <greg@kroah.com>
Date: Thu, 12 May 2011 05:31:09 +0000
Subject: Re: [PATCH 00/12] staging: usbip: miscellaneous code cleanup
Message-Id: <20110512053109.GA26926@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1305103212.git.mfm@muteddisk.com>
 <20110511211401.GC4893@kroah.com>
 <BANLkTikjf9ZAthr3jTUkoUKGJt2UGS73Cg@mail.gmail.com>
 <20110511231843.GC7362@kroah.com>
 <BANLkTim_WZdmE31qjChg8u0M8RKzez3fqg@mail.gmail.com>
In-Reply-To: <BANLkTim_WZdmE31qjChg8u0M8RKzez3fqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 11, 2011 at 08:24:12PM -0700, matt mooney wrote:
> > We add it to drivers/staging/usbip/userspace/ and build it like the perf
> > code is built.
> 
> Okay, I will add the code as is to userspace/ except for the module
> name changes of course. Now I am suppose to add this to
> scripts/packages/Makefile or is there another way for staging?

I really don't know as I haven't looked at that part of the build system
in years.  If you have problems, I will be glad to help out, but give it
a try first :)

thanks,

greg k-h
