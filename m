From: Ira Weiny <ira.weiny@intel.com>
Date: Wed, 25 Sep 2019 21:15:20 +0000
Subject: Re: [PATCH V2] bnvdimm/namsepace: Don't set claim_class on error
Message-Id: <20190925211520.GA12748@iweiny-DESK2.sc.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925184852.11707-1-ira.weiny@intel.com>
 <CAPcyv4jtYxggf-+ZvO5PN3KTMjiqqJrpj_V39_9axJZNpG_EQg@mail.gmail.com>
In-Reply-To: <CAPcyv4jtYxggf-+ZvO5PN3KTMjiqqJrpj_V39_9axJZNpG_EQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-nvdimm <linux-nvdimm@lists.01.org>

On Wed, Sep 25, 2019 at 12:36:35PM -0700, Dan Williams wrote:
> On Wed, Sep 25, 2019 at 11:49 AM <ira.weiny@intel.com> wrote:
> >

[snip]

> >
> > ---
> > V1->V2
> >         Add space after variable declaration...
> 
> Oh, was also hoping this would address s/bnvdimm/libnvdimm/ in the
> patch subject.

Yea...

> 
> Note, kernel-janitors is for minor spelling fixes and trivial changes
> with no runtime side-effects that might otherwise fall through the
> cracks. This has functional implications so is not a janitorial
> change.

Ah yea I just thought it was ok to let that list know what was going on...
I've removed them from V3.  Sorry.

> 
> One more comment below...
> 

[snip]

> > -
> 
> Since this effectively replaces Dan's patch can you respin without
> that baseline, and just give Dan credit with a Reported-by?

V3 sent.

Ira
