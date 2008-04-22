From: Adrian Bunk <bunk@kernel.org>
Date: Tue, 22 Apr 2008 15:58:39 +0000
Subject: Re: cli()/sti() removal
Message-Id: <20080422155838.GA28933@cs181133002.pp.htv.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Apr 22, 2008 at 09:47:22AM -0600, Matthew Wilcox wrote:
> On Fri, Apr 18, 2008 at 07:18:14PM +0300, Adrian Bunk wrote:
> > On Mon, Apr 14, 2008 at 02:17:50PM -0600, Matthew Wilcox wrote:
>...
> > > I also note that there's a xircom_cb that appears to be replacing
> > > xircom_tulip_cb, so maybe deleting xircom_tulip_cb is possible?
> > >...
> > 
> > I beat you by 3 months.  ;)
> > 
> > Patch is in the net tree and should go into Linus' tree within the next
> > two weeks.
> 
> Why do the tulip maintainers not know about this?

tulip has a separate maintainer?

/me checks MAINTAINERS

Sorry, there seem to still be parts of MAINTAINERS I am not aware of.

The patch went to Jeff and netdev, and Jeff applied it (perhaps 
wrongly assuming I was aware that there are tulip maintainers?).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

