From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Sat, 29 Nov 2014 13:59:47 +0000
Subject: Re: [PATCH v2] fs-fat: Less function calls in fat_fill_super() after error detection
Message-Id: <87lhmu2jl8.fsf@devron.myhome.or.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
	<530A086E.8010901@users.sourceforge.net>
	<alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
	<530A72AA.3000601@users.sourceforge.net>
	<alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
	<530B5FB6.6010207@users.sourceforge.net>
	<alpine.DEB.2.10.1402241710370.2074@hadrien>
	<530C5E18.1020800@users.sourceforge.net>
	<alpine.DEB.2.10.1402251014170.2080@hadrien>
	<530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<5467B12C.4010602@users.sourceforge.net>
	<alpine.DEB.2.02.1411152117540.2225@localhost6.localdomain6>
	<54796B5E.5040707@users.sourceforge.net>
	<87sih22sn8.fsf@devron.myhome.or.jp>
	<alpine.DEB.2.10.1411291338530.2378@hadrien>
In-Reply-To: <alpine.DEB.2.10.1411291338530.2378@hadrien> (Julia Lawall's
	message of "Sat, 29 Nov 2014 13:40:34 +0100 (CET)")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Coccinelle <cocci@systeme.lip6.fr>

Julia Lawall <julia.lawall@lip6.fr> writes:

>> iput() checks NULL of inode. What is wrong just remove NULL check,
>> instead of adding new jump labels?
>
> Personally, I prefer that code that can be statically determined not to
> need to be executed not to be executed.  It can make the code easier to
> understand, because each function is only called when doing so is useful,
> and it can be helpful to static analysis.

Hm, first of all, we want to prevent the bugs. More labels are more
chances of bug (and we don't care micro optimize on this error path),
isn't it?  Increasing the chance of bugs and bothers developers for
analyzer sounds like strange.

(And we are initializing those for avoiding to be bothered by choosing
correct label. If we really care micro optimize, initialization of those
should not be required and should not be touched on other paths, and gcc
can warn its usage.)

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
