From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 04 Mar 2020 21:02:35 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to filesystem doc ReST conversion
Message-Id: <alpine.DEB.2.21.2003042151430.2698@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304072950.10532-1-lukas.bulwahn@gmail.com> <20200304131035.731a3947@lwn.net> <20200304212846.0c79c6da@coco.lan>
In-Reply-To: <20200304212846.0c79c6da@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 4 Mar 2020, Mauro Carvalho Chehab wrote:

> Em Wed, 4 Mar 2020 13:10:35 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > 
> > Sigh, I need to work a MAINTAINERS check into my workflow...
> > 
> > Thanks for fixing these, but ... what tree did you generate the patch
> > against?  I doesn't come close to applying to docs-next.
> 
> I'm starting to suspect that maybe the best workflow would be to just 
> apply the patches at docs-next keeping links broken, and then run
> ./scripts/documentation-file-ref-check --fix by the end of a merge
> window, addressing such breakages.
> 
> There are usually lots of churn outside the merge window.
>

Agree, it is probably the simplest solution to get such things fixed at 
the end of the merge window; there are many of such 'automatic' fixes (and 
scripts that generate them). It just needs somebody to convince Linus to
have a trusted end-of-merge-window clean-up team to provide a final pull 
request on Sunday afternoon to fix all those minor points.
 
> Another alternative would be to split the MAINTAINERS file on a
> per-subsystem basis. If I remember well, someone proposed this once at
> LKML. I vaguely remember that there were even a patch (or RFC)
> adding support for such thing for get_maintainers.pl.
> 

I would also support that idea. In the meantime, I am looking into the 
effort to identify and fix these issues when they are submitted to the 
mailing list. It is not the simplest solution, but at least a solution 
that I can try to work on individually at first.

Lukas
