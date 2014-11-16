From: Steven Rostedt <rostedt@goodmis.org>
Date: Sun, 16 Nov 2014 21:49:55 +0000
Subject: Re: [PATCH v2 2/2] kernel-trace: Less calls for iput() in create_trace_uprobe() after error detectio
Message-Id: <20141116164955.4f6f0c84@gandalf.local.home>
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
	<5468ABBD.6000903@users.sourceforge.net>
	<alpine.DEB.2.10.1411161656340.2364@hadrien>
	<5468F756.8070807@users.sourceforge.net>
	<5468F96E.4090903@users.sourceforge.net>
	<20141116143120.44421df2@gandalf.local.home>
	<alpine.DEB.2.10.1411162034190.2364@hadrien>
In-Reply-To: <alpine.DEB.2.10.1411162034190.2364@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Ingo Molnar <mingo@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

On Sun, 16 Nov 2014 20:34:59 +0100 (CET)
Julia Lawall <julia.lawall@lip6.fr> wrote:

> I wuold have thought that one could have just returned, like in the cases
> above...  But maybe the printed message is useful.

Yes, it lets us know that the format string failed to parse.

-- Steve

