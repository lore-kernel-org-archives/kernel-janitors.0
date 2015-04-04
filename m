From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 04 Apr 2015 17:21:51 +0000
Subject: Re: [PATCH 2/2] staging: emxx_udc: test returned value
Message-Id: <alpine.DEB.2.02.1504041919350.2075@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428159570-19467-1-git-send-email-Julia.Lawall@lip6.fr> <1428159570-19467-3-git-send-email-Julia.Lawall@lip6.fr> <20150404160712.GA19278@kroah.com> <alpine.DEB.2.02.1504041818180.2075@localhost6.localdomain6> <20150404171243.GY10964@mwanda>
In-Reply-To: <20150404171243.GY10964@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Sat, 4 Apr 2015, Dan Carpenter wrote:

> On Sat, Apr 04, 2015 at 06:20:53PM +0200, Julia Lawall wrote:
> > Couldn't one say:
> > 
> > x = NULL;
> > y = &x->whatever;
> > z = container_of(y, struct blah, whatever);
> > 
> > and end up with z being NULL?
> 
> That is crazy person code.  It looks deliberately wrong.  If we start
> merging deliberate mistakes then we're already screwed.
> 
> I have a smatch check which warns on container_of() but I should update
> it to not complain if it's the first struct member.  I have looked at
> quite a few of these warnings and I worry that there are some places
> where it relies on container_of() to be a no-op...  That's also crazy
> but it's the kind of crazy that people do in real life.  :P

OK.  Should I update the patch to remove the test?

I find 57 NULL tests on the result of container_of in the kernel as a 
whole.

julia
