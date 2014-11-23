From: Joe Perches <joe@perches.com>
Date: Sun, 23 Nov 2014 19:06:26 +0000
Subject: Re: thunderbolt: Deletion of unnecessary checks before the function call "ring_free"
Message-Id: <1416769586.6651.49.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
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
	 <5317A59D.4@users.sourceforge.net> <546F16A5.8030405@users.sourceforge.net>
	 <CAMxnaaVLhKHjbzUJy5p_0n8BUprzSQ=A3sdF6iQzW_wqmq8N4A@mail.gmail.com>
	 <546F2E50.5040804@users.sourceforge.net>
	 <1416593688.6651.39.camel@perches.com>
	 <5471EBAC.40903@users.sourceforge.net>
	 <1416756022.6651.45.camel@perches.com>
	 <54720061.7010401@users.sourceforge.net>
	 <alpine.DEB.2.02.1411231650580.2037@localhost6.localdomain6>
	 <54722F88.8050805@users.sourceforge.net>
In-Reply-To: <54722F88.8050805@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Andreas Noever <andreas.noever@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, 2014-11-23 at 20:03 +0100, SF Markus Elfring wrote:
> > Why not just make the static source code analysis aware of the problem?
> 
> This is also possible, of course.
> 
> 
> > You can treat static functions differently that non-static ones.
> 
> I have added this detail to my ideas around the next fine-tuning
> for the published semantic patch approach.
> 
> 
> > There is no need to change the code.
> 
> Can name space prefixes help to make source code a bit safer eventually?

Not really.
Adding prefixes can make code unnecessarily more verbose though.

