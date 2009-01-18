From: Julia Lawall <julia@diku.dk>
Date: Sun, 18 Jan 2009 16:11:10 +0000
Subject: Re: [PATCH 2/3] drivers/gpu/drm: fix sparse warnings: unexport
Message-Id: <Pine.LNX.4.64.0901181710000.661@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090118152725.4179.40835.stgit@vmbox.hanneseder.net> 
 <20090118152848.4179.85741.stgit@vmbox.hanneseder.net> 
 <1232294164.24415.3.camel@localhost.localdomain>
 <154e089b0901180804k46e9411lcbc10f591871b14@mail.gmail.com>
In-Reply-To: <154e089b0901180804k46e9411lcbc10f591871b14@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Jaswinder Singh Rajput <jaswinder@kernel.org>, dri-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> >> -EXPORT_SYMBOL(drm_mode_validate_clocks);
> >
> > ??
> 
> In both cases: a grep over the entire kernel tree shows that the
> function is only used within the compilation unit it is defined,
> therefore make it static and un-EXPORT it.

I don't know anything about this specific context, but aren't things in 
general exported so that external modules can use them?  If that is the 
case, grepping over the kernel sources is not sufficient.

julia
