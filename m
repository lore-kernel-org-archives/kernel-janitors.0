From: matt mooney <mfm@muteddisk.com>
Date: Sat, 02 Oct 2010 04:14:09 +0000
Subject: Re: [PATCH] Documentation/kbuild: correct variable definitions in
Message-Id: <20101002041409.GA6370@haskell.muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284964412-32211-1-git-send-email-mfm@muteddisk.com>
 <4CA35541.9090106@suse.cz>
 <20100929175031.GA9278@merkur.ravnborg.org>
 <20100929231904.GB21930@haskell.muteddisk.com>
 <20101001205646.GA10988@sepie.suse.cz>
In-Reply-To: <20101001205646.GA10988@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Marek <mmarek@suse.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 22:56 Fri 01 Oct     , Michal Marek wrote:
> On Wed, Sep 29, 2010 at 04:19:04PM -0700, matt mooney wrote:
> > On 19:50 Wed 29 Sep     , Sam Ravnborg wrote:
> > > On Wed, Sep 29, 2010 at 05:03:29PM +0200, Michal Marek wrote:
> > > > On 20.9.2010 08:33, matt mooney wrote:
> > > > > Change $(src) and $(obj) definitions to state the path as absolute and
> > > > > not relative.
> > > > 
> > > > It _is_ a relative patch, AFAICS. What makes you think otherwise?
> > > 
> > > With extenal modules $(src) and $(obj) are absolute - but in nomal
> > > use they are relative.
> 
> Ah, I see. Then we should simply say "path", without any adjectives.

That may lead to people wondering what kind of path it is, or assumptions that
it is absolute due to being stated as such in modules.txt. Maybe a more detailed
explanation would suffice.

-mfm
