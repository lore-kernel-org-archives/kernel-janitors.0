From: Greg KH <greg@kroah.com>
Date: Fri, 20 May 2011 00:24:01 +0000
Subject: Re: [PATCH] staging: usbip: replace usbip_u{dbg,err,info} and printk
Message-Id: <20110520002401.GA17623@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2db81796703063c0816d0d99040c6fbd6da50007.1305847719.git.mfm@muteddisk.com>
 <20110520000013.GA8908@kroah.com>
 <BANLkTik=S-FRB25gNHcb0OLMW5dhqLE1eA@mail.gmail.com>
In-Reply-To: <BANLkTik=S-FRB25gNHcb0OLMW5dhqLE1eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfmooney@gmail.com>
Cc: matt mooney <mfm@muteddisk.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 19, 2011 at 05:17:45PM -0700, matt mooney wrote:
> On Thu, May 19, 2011 at 5:00 PM, Greg KH <greg@kroah.com> wrote:
> > Also, the merge window for the .40 tree for the staging tree is now
> > closed, so I'll only take bugfixes for the usbip code for now.
> 
> The userspace code isn't getting merged in .40, is it? Because my
> patch "staging: usbip: userspace: stub_driver.c: update kernel module
> name" actually relies on a change in my own tree, so I made a mistake
> by thinking that it was needed right away to get the userspace tools
> working.

It's in my tree, so yes.  You can send me patches to fix the problem, as
I would recommend :)

greg k-h
