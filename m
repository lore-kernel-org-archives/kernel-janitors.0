From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 01 Mar 2012 01:09:18 +0000
Subject: Re: [PATCH] Trace: initialize variable to clear warning
Message-Id: <1330564158.25686.230.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330420174-20537-1-git-send-email-ruan.zhengwang@gmail.com>
	 <1330438591.25686.214.camel@gandalf.stny.rr.com>
	 <48875.1330555230@turing-police.cc.vt.edu>
In-Reply-To: <48875.1330555230@turing-police.cc.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: Zhengwang Ruan <ruan.zhengwang@gmail.com>, fweisbec@gmail.com, mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2012-02-29 at 17:40 -0500, Valdis.Kletnieks@vt.edu wrote:
> On Tue, 28 Feb 2012 09:16:31 EST, Steven Rostedt said:
> 
> > This is a bug in gcc that's fixed in 4.6 and beyond. I don't want to
> > remove this warning because it will hide a real bug if page2 really does
> > become uninitialized. If 4.6 gives a warning here, then I'll fix it.
> 
> > > -	void *page2;
> > > +	void *uninitialized_var(page2);
> 
> How would you feel about this?
> 
> -	void *page2;
> +	void *page2; /* gcc 4.5 bug causes incorrect "uninitialized" warning */
> 
> or something similar?

/* if you get a warning here, upgrade your gcc to 4.6 */


-- Steve



