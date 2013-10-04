From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Oct 2013 08:37:37 +0000
Subject: Re: [PATCH] FIXED sparse warning : drivers/cpuidle/cpuidle.c:27:1: warning: symbol 'cpuidle_dev' was
Message-Id: <20131004083737.GB6192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1380739624-17257-1-git-send-email-sgr.m.pdy@gmail.com>
In-Reply-To: <1380739624-17257-1-git-send-email-sgr.m.pdy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Oct 03, 2013 at 12:04:40PM +0530, Sagar Padhye wrote:
> > > I checked that cpuidle_devices is only being used in cpuidle.c - hence
> > > thought that it can be made static and be removed from header.
> > 
> > "cpuidle_devices" is actually used in drivers/cpuidle/coupled.c as well
> > so this breaks the build.
> 
> Darn! I forgot 'clean build' part. sorry.
>  
> > Even for "cpuidle_dev" the patch isn't right.  It doesn't fix the
> > warning, for me.  The DEFINE_PER_CPU() macro defines several variables
> > actually.  Per CPU variables are a bit complicated and they have to have
> > globally unique names.  So just ignore the Sparse warning for per CPU
> > variables.
> > 
> 
> Ok, let me look at my sparse log once again, will pick some other
> problem (any suggestions?)

You're on the right track.  Just the details are wrong.

regards,
dan carpenter

