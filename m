From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 03 Apr 2014 15:52:06 +0000
Subject: Re: [PATCH] staging: vme: Fix a small coding style issue in vme_user.c
Message-Id: <20140403155206.GA1874@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396477450-5354-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1396477450-5354-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 03, 2014 at 05:40:25PM +0200, bojan prtvar wrote:
> On Thu, Apr 3, 2014 at 5:14 PM, walter harms <wharms@bfs.de> wrote:
> 
> > beside style:
> > that sprint looks like as it could be replaced with a
> >  name="bus/vme/m%%d"
> >
> > any takers ?
> >
> > re,
> >  wh
> >
> 
> Hi Walter,
> 
> I guess you mean something like this? Please review carefully if I got
> right "%%d" intent.
> Now a basic question. How to submit this properly? As a v2 patch with
> both changes taken or as a two-patch serie?

2 patch series, or just a new patch that is on top of your previous one
and mention that in the line below the --- in the patch

thanks,

greg k-h
