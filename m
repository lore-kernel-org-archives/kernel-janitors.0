From: Sam Ravnborg <sam@ravnborg.org>
Date: Thu, 11 Dec 2008 21:05:37 +0000
Subject: Re: [PATCH 0/9] mISDN: fix sparse warnings
Message-Id: <20081211210537.GA27010@uranus.ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <493feaa6.05a0660a.4b69.407f@mx.google.com> <20081210173056.GB15810@pingi.kke.suse.de> <20081211122245.754e7829.akpm@linux-foundation.org>
In-Reply-To: <20081211122245.754e7829.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, David Miller <davem@davemloft.net>
Cc: Karsten Keil <kkeil@suse.de>, hannes@hanneseder.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 11, 2008 at 12:22:45PM -0800, Andrew Morton wrote:
> On Wed, 10 Dec 2008 18:30:56 +0100
> Karsten Keil <kkeil@suse.de> wrote:
> 
> > On Tue, Dec 09, 2008 at 08:49:30PM +0100, Hannes Eder wrote:
> > > This series of patches fixes a fair amount of sparse warnings in mISDN.
> > > 
> > 
> > Acked-by: Karsten keil <kkeil@suse.de>
> > 
> > to all.
> > 
> 
> I was going to apply these but
> 
> a) It's nine patches all with the same title and I can't be bothered
>    thinking up useful titles for each one.  See
>    Documentation/SubmittingPatches
> 
> b) I can't find all the patches on lkml.
> 
> c) Why am I applying misdn patches anyway?  If someone else already
>    applied them then they aren't in linux-next.

Lately Davis Miller has included ISDN stuff in net-next.
Try to fix the commented issues, add the acks you got, give patches
proper titles and submit to netdev@vger.kernel.org

	Sam
