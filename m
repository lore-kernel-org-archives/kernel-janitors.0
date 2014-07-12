From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2014 20:24:15 +0000
Subject: Re: [PATCH] staging: android: Cleanup style issues
Message-Id: <20140712202415.GA10041@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405194956-4590-1-git-send-email-peter.senna@gmail.com>
 <20140712202310.GA9919@kroah.com>
In-Reply-To: <20140712202310.GA9919@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: swetland@google.com, daniel@ffwll.ch, maarten.lankhorst@canonical.com, john.stultz@linaro.org, sumit.semwal@linaro.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 12, 2014 at 01:23:10PM -0700, Greg KH wrote:
> On Sat, Jul 12, 2014 at 09:55:56PM +0200, Peter Senna Tschudin wrote:
> > This patch fixes the following checkpatch warnings:
> >  - Remove else after return
> >  - Add space after declaration
> > 
> > Tested by compilation only.
> > 
> > Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> > ---
> >  drivers/staging/android/sync_debug.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> This file is no longer in my kernel tree, what tree did you make it
> against?
> 
> Please create staging patches against the staging-next branch of the
> staging.git tree on git.kernel.org so that I can apply them.

Ah, nevermind, things moved around here, I figured this out, sorry for
the noise...

greg k-h
