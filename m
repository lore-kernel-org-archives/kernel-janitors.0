From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 30 Jun 2020 20:32:45 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM SMC WATCHDOG DRIVER
Message-Id: <20200630203245.GA19763@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200602052104.7795-1-lukas.bulwahn@gmail.com>
 <828311d2-61ea-42cb-1449-a53f3772543d@roeck-us.net>
 <CAODwPW_oxDxF_5-icRs0eaRVLgtP+bDc_OSKa=EcfeSp=c6Fag@mail.gmail.com>
 <CAKz_xw0Tqr-idoZbNzg_didSCr5L+L1=76xjF=Sqj4DgpL9g7Q@mail.gmail.com>
 <CAKz_xw3KuWFSkcz-9hLHGZ2=S7nJ=K=AN6j2FJ6afZBFowJO7g@mail.gmail.com>
 <alpine.DEB.2.21.2006302156120.3966@felia>
In-Reply-To: <alpine.DEB.2.21.2006302156120.3966@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Evan Benn <evanbenn@chromium.org>, Julius Werner <jwerner@chromium.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jun 30, 2020 at 09:59:51PM +0200, Lukas Bulwahn wrote:
> 
> 
> On Fri, 5 Jun 2020, Evan Benn wrote:
> 
> > AFAICT this has now been merged upstream, I'm not sure what action to take:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id\24a28b4eb842ad1256496be6ae01bab15f1dcb
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?idra9e7fea5866fc471fda78f05f166595c8c6ba6
> 
> This patch is still fully valid and still applies to next-20200630; it can 
> be simply applied as any other bug fix to your driver code.
> 
> Evan, can you please ask Wim as linux-watchdog maintainer to pick-up this 
> patch, with the reviews below?
> 

It is in my tree. Maybe it got lost in the back-and-forth. I'll send
a pull request to Wim in the next couple of weeks.

Guenter
