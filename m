From: David Woodhouse <dwmw2@infradead.org>
Date: Fri, 16 Jul 2010 14:28:39 +0000
Subject: Re: [PATCH 1/3] fix staging/spectra: removes q->prepare_flush_fn
Message-Id: <1279290519.26249.50.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278732312.1725.17.camel@lenovo>
In-Reply-To: <1278732312.1725.17.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2010-07-16 at 15:14 +0100, Randy Dunlap wrote:
> On 07/15/10 18:24, Javier Martinez Canillas wrote:
> >>
> >> These 3 patches fix the build errors.
> >> There are still some warnings that should be addressed.
> >>
> >> Thanks.
> >>
> >> Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
> >>
> >>
> > 
> > Thanks a lot for reviewing the patches. I can address the warnings.
> > Should I send patches as a delta of these three patches or do I resend
> > a patchset containing  these three and the others that will address
> > the warnings?
> 
> Greg, which do you prefer?
> 
> I would just send more patches as deltas, but it's up to Greg.
> AFAIK, he hasn't applied these 3 yet.

Or should I keep a tree for the spectra driver, apply patches to *that*
and ask Greg to pull from it?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

