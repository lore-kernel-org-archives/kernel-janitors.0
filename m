From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Sat, 29 Nov 2014 16:08:56 +0000
Subject: Re: fs-fat: Less function calls in fat_fill_super() after error detection
Message-Id: <87egsm2dlz.fsf@devron.myhome.or.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
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
	<87lhmu2jl8.fsf@devron.myhome.or.jp>
	<5479DD48.6030508@users.sourceforge.net>
In-Reply-To: <5479DD48.6030508@users.sourceforge.net> (SF Markus Elfring's
	message of "Sat, 29 Nov 2014 15:50:48 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Coccinelle <cocci@systeme.lip6.fr>

SF Markus Elfring <elfring@users.sourceforge.net> writes:

>> More labels are more chances of bug (and we don't care micro optimize
>> on this error path), isn't it?
>
> I would prefer that a few jump targets can be redirected so that unnecessary
> function calls (and corresponding checks) can be avoided.

It is from real bugs in my experience, it saw several times those (mine
and other guys, in linux and others). And I think it doesn't have value
to maintain labels for micro optimization in *this error path* though.

So, if you or analyzer can check bugs by the patches affect to those
label usage in future,

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
