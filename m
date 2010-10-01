From: Michal Marek <mmarek@suse.cz>
Date: Fri, 01 Oct 2010 20:56:46 +0000
Subject: Re: [PATCH] Documentation/kbuild: correct variable definitions in
Message-Id: <20101001205646.GA10988@sepie.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284964412-32211-1-git-send-email-mfm@muteddisk.com>
 <4CA35541.9090106@suse.cz>
 <20100929175031.GA9278@merkur.ravnborg.org>
 <20100929231904.GB21930@haskell.muteddisk.com>
In-Reply-To: <20100929231904.GB21930@haskell.muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfm@muteddisk.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 29, 2010 at 04:19:04PM -0700, matt mooney wrote:
> On 19:50 Wed 29 Sep     , Sam Ravnborg wrote:
> > On Wed, Sep 29, 2010 at 05:03:29PM +0200, Michal Marek wrote:
> > > On 20.9.2010 08:33, matt mooney wrote:
> > > > Change $(src) and $(obj) definitions to state the path as absolute and
> > > > not relative.
> > > 
> > > It _is_ a relative patch, AFAICS. What makes you think otherwise?
> > 
> > With extenal modules $(src) and $(obj) are absolute - but in nomal
> > use they are relative.

Ah, I see. Then we should simply say "path", without any adjectives.


> > And again in normal use they are also equal. I usually say that we
> > have two just to document what is srource and what is generated.
> 
> Ah, I see. Sorry, I should have looked into this more. Now you did say
> in normal use they are equal, but I thought they were also equal when
> used for an external module too.

Yes, they are, using $(src) for shipped files and $(obj) for generated
ones is just a service for the reader of the Makefile.

Michal
