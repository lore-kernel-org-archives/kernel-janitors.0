From: Greg KH <greg@kroah.com>
Date: Tue, 05 Oct 2010 22:20:15 +0000
Subject: Re: [PATCH v3 12/20] Staging: rtl8192su: ieee80211: Makefile:
Message-Id: <20101005222015.GA28165@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286037489-28439-1-git-send-email-tdent48227@gmail.com>
 <1286037489-28439-12-git-send-email-tdent48227@gmail.com>
 <20101005190209.GA3386@kroah.com>
 <AANLkTimY3iVfQgpNqJAVATFCMaQ1b=xyvyVKctyxMkFs@mail.gmail.com>
In-Reply-To: <AANLkTimY3iVfQgpNqJAVATFCMaQ1b=xyvyVKctyxMkFs@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: T Dent <tdent48227@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org

On Tue, Oct 05, 2010 at 05:47:23PM -0400, T Dent wrote:
> On 10/5/10, Greg KH <greg@kroah.com> wrote:
> > On Sat, Oct 02, 2010 at 12:38:01PM -0400, Tracey Dent wrote:
> >> Changed to use the proper ccflags-y option
> >>
> >> Signed-off-by: Tracey Dent <tdent48227@gmail.com>
> >> ---
> >>  drivers/staging/rtl8192su/ieee80211/Makefile |   10 +++++-----
> >
> > This file is no longer in linux-next.
> 
> I Didn't know that. I guess because I did the patches based on the
> current linus tree.

You should always send patches against the linux-next tree, as it
contains the accumulated patches that will be sent to Linus next time
around.

> So you want me to resend it without this driver?

Nope, I got your other ones.

thanks,

greg k-h
