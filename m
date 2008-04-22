From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 22 Apr 2008 15:47:22 +0000
Subject: Re: cli()/sti() removal
Message-Id: <20080422154722.GI20637@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 18, 2008 at 07:18:14PM +0300, Adrian Bunk wrote:
> On Mon, Apr 14, 2008 at 02:17:50PM -0600, Matthew Wilcox wrote:
> >...
> > include/asm-frv/system.h:     cli();                                  \
> 
> I'll send a patch for this one (it's in an unused macro).

Thanks.

> >...
> > I also note that there's a xircom_cb that appears to be replacing
> > xircom_tulip_cb, so maybe deleting xircom_tulip_cb is possible?
> >...
> 
> I beat you by 3 months.  ;)
> 
> Patch is in the net tree and should go into Linus' tree within the next
> two weeks.

Why do the tulip maintainers not know about this?

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
