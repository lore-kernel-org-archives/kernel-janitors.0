From: Martin KaFai Lau <kafai@fb.com>
Date: Sat, 28 Apr 2018 01:27:11 +0000
Subject: Re: [PATCH 2/2] bpf: btf: remove a couple conditions
Message-Id: <20180428012646.r6idamuylruykb7h@kafai-mbp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427140459.GB19583@mwanda>
 <20180427172023.6japncdd3nbqauzn@kafai-mbp>
 <20180427175544.vydqf4iufopcyv6d@kafai-mbp>
 <20180427193959.3nebosalgl3ch4mv@mwanda>
 <21126ae9-5178-5d09-679c-6bca57ad48e8@iogearbox.net>
 <20180427203135.mjkqoofbanozxzkd@mwanda>
 <20180427212648.zskc5bk2hunkwvsg@kafai-mbp.dhcp.thefacebook.com>
In-Reply-To: <20180427212648.zskc5bk2hunkwvsg@kafai-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 27, 2018 at 02:26:50PM -0700, Martin KaFai Lau wrote:
> On Fri, Apr 27, 2018 at 11:31:36PM +0300, Dan Carpenter wrote:
> > On Fri, Apr 27, 2018 at 10:21:17PM +0200, Daniel Borkmann wrote:
> > > On 04/27/2018 09:39 PM, Dan Carpenter wrote:
> > > > On Fri, Apr 27, 2018 at 10:55:46AM -0700, Martin KaFai Lau wrote:
> > > >> On Fri, Apr 27, 2018 at 10:20:25AM -0700, Martin KaFai Lau wrote:
> > > >>> On Fri, Apr 27, 2018 at 05:04:59PM +0300, Dan Carpenter wrote:
> > > >>>> We know "err" is zero so we can remove these and pull the code in one
> > > >>>> indent level.
> > > >>>>
> > > >>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > >>> Thanks for the simplification!
> > > >>>
> > > >>> Acked-by: Martin KaFai Lau <kafai@fb.com>
> > > >> btw, it should be for bpf-next.  Please tag the subject with bpf-next when
> > > >> you respin. Thanks!
> > > 
> > > Dan, thanks a lot for your fixes! Please respin with addressing Martin's
> > > feedback when you get a chance.
> > > 
> > 
> > My understanding is that he'd prefer we just ignore the static checker
> > warning since it's a false positive.
> Right, I think patch 1 is not needed.  I would prefer to use a comment
> in those cases.
> 
> > Should I instead initialize the
> > size to zero or something just to silence it?
After another thought,  I think init size to zero is
fine which is less intrusive.

Thanks!
Martin

> > 
> > regards,
> > dan carpenter
> > 
