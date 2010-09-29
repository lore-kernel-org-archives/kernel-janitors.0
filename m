From: Sam Ravnborg <sam@ravnborg.org>
Date: Wed, 29 Sep 2010 17:50:31 +0000
Subject: Re: [PATCH] Documentation/kbuild: correct variable definitions in
Message-Id: <20100929175031.GA9278@merkur.ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284964412-32211-1-git-send-email-mfm@muteddisk.com> <4CA35541.9090106@suse.cz>
In-Reply-To: <4CA35541.9090106@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Marek <mmarek@suse.cz>
Cc: matt mooney <mfm@muteddisk.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 29, 2010 at 05:03:29PM +0200, Michal Marek wrote:
> On 20.9.2010 08:33, matt mooney wrote:
> > Change $(src) and $(obj) definitions to state the path as absolute and
> > not relative.
> 
> It _is_ a relative patch, AFAICS. What makes you think otherwise?

With extenal modules $(src) and $(obj) are absolute - but in nomal use they are relative.
And again in normal use they are also equal. I usually say that we have two just to document
what is srource and what is generated.

	Sam
