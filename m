From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Fri, 21 Sep 2012 00:02:49 +0000
Subject: Re: [battery:master 23/24] drivers/mfd/88pm860x-core.c:803:39: warning: assignment from incompatible
Message-Id: <20120921000249.GA14399@lizard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120920225658.GA12235@localhost>
In-Reply-To: <20120920225658.GA12235@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 21, 2012 at 07:29:42AM +0800, Fengguang Wu wrote:
[...]
> Yes. Because I'm building every commit,

Oh, I see.

> > I think you're building with HEAD = a830d28b48bf9294, but why?
> > (And 23/24 makes me think that you're indeed missing the latest
> > commit.)
> 
> This report is for [23/24] a830d28b. The head ([24/24] f1ade35253f50)
> fixes the warning. Oh well, some warnings may not hurt bisectability
> while others do lead to runtime errors, so I can hardly avoid false
> reports on such fixed-in-HEAD warnings..
> 
> But if your tree never rebases, I can definitely avoid sending reports
> for such intermediate errors/warnings.

It's fine -- these reports are useful even if I don't rebase, now I
just know that interim warnings are also reported.

And sometimes I do rebase, if there's some major bisectabilty problem
(which I surely don't want to appear in upstream).

Thanks,
Anton.
