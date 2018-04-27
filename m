From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Apr 2018 19:39:59 +0000
Subject: Re: [PATCH 2/2] bpf: btf: remove a couple conditions
Message-Id: <20180427193959.3nebosalgl3ch4mv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427140459.GB19583@mwanda>
 <20180427172023.6japncdd3nbqauzn@kafai-mbp>
 <20180427175544.vydqf4iufopcyv6d@kafai-mbp>
In-Reply-To: <20180427175544.vydqf4iufopcyv6d@kafai-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin KaFai Lau <kafai@fb.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Apr 27, 2018 at 10:55:46AM -0700, Martin KaFai Lau wrote:
> On Fri, Apr 27, 2018 at 10:20:25AM -0700, Martin KaFai Lau wrote:
> > On Fri, Apr 27, 2018 at 05:04:59PM +0300, Dan Carpenter wrote:
> > > We know "err" is zero so we can remove these and pull the code in one
> > > indent level.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Thanks for the simplification!
> > 
> > Acked-by: Martin KaFai Lau <kafai@fb.com>
> btw, it should be for bpf-next.  Please tag the subject with bpf-next when
> you respin. Thanks!
>

I'm working against linux-next.  For networking, I have a separate tree
which I use to figure out if it's in net or net-next.  It's kind of a
headache (but obviously networking is the largest subtree so it's
required).

Is there an automated way to tie a Fixes tag from linux-next to a
subtree?

regards,
dan carpenter

