From: "Hannes Eder" <hannes@hanneseder.net>
Date: Sun, 18 Jan 2009 17:42:06 +0000
Subject: Re: [PATCH 2/3] drivers/gpu/drm: fix sparse warnings: unexport symbols
Message-Id: <154e089b0901180942o46b80006q5e0d586cb3e1841c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090118152725.4179.40835.stgit@vmbox.hanneseder.net>
	 <20090118152848.4179.85741.stgit@vmbox.hanneseder.net>
	 <1232294164.24415.3.camel@localhost.localdomain>
	 <154e089b0901180804k46e9411lcbc10f591871b14@mail.gmail.com>
	 <Pine.LNX.4.64.0901181710000.661@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0901181710000.661@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, Jaswinder Singh Rajput <jaswinder@kernel.org>
Cc: dri-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jan 18, 2009 at 5:11 PM, Julia Lawall <julia@diku.dk> wrote:
> I don't know anything about this specific context, but aren't things in
> general exported so that external modules can use them?  If that is the
> case, grepping over the kernel sources is not sufficient.

Good point, but it indicates that the function does not have a caller
within kernel tree.
Ok, there could be other clients.  So this patch might just be a hint
for the original author or maintainer that there is maybe no need to
export this function.

On Sun, Jan 18, 2009 at 5:18 PM, Jaswinder Singh Rajput
<jaswinder@kernel.org> wrote:
> If it is EXPORTED you cannot make it static. EXPORTED means it can be
> used from a kernel module.

Right, that's why I have made it static and removed the EXPORT_SYMBOL,
all under the assumption that there is _no_ client for this function,
but there may be some outside the kernel tree.  I can not judge this.

Hannes
