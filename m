From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 07 May 2015 15:32:31 +0000
Subject: Re: [HPDD-discuss] [PATCH] staging: lustre: code cleanup - variable declaration spacing
Message-Id: <alpine.DEB.2.10.1505071732140.2462@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430913775-28350-1-git-send-email-shuey@purdue.edu> <D1703976.EF0A5%andreas.dilger@intel.com> <20150507120908.GG14154@mwanda>
In-Reply-To: <20150507120908.GG14154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Dilger, Andreas" <andreas.dilger@intel.com>, Mike Shuey <shuey@purdue.edu>, "Drokin, Oleg" <oleg.drokin@intel.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

On Thu, 7 May 2015, Dan Carpenter wrote:

> On Thu, May 07, 2015 at 03:36:05AM +0000, Dilger, Andreas wrote:
> > On 2015/05/06, 6:02 AM, "Mike Shuey" <shuey@purdue.edu> wrote:
> >
> > >Clean up spacing in some variable declarations, to be more consistent.
> > >
> > >It's small, but I need to start somewhere.  Please let me know if I'm not
> > >adhering to proper procedure for trivial cleanups.
> >
> > It's actually Lustre coding style to align the variable declarations.
> > Is this something that causes checkpatch.pl to complain?  If not, I'd
> > prefer not to change all of these declarations, since it causes a lot
> > of code churn for very little benefit.
>
> In theory it's nice, but in reality aligning variables doesn't work in
> .c files.  If you look at the patch, almost every declaration block uses
> higgledy piggledy alignment.

Probably the use of tabs and spaces is not consistent.

julia
