From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Wed, 09 Sep 2020 07:50:36 +0000
Subject: Re: [PATCH] scripts: coccicheck: Do not use shift command when rule is specified
Message-Id: <20200909073836.yrsqb6o4i3c47xd4@adolin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <036792a4-0454-732a-8a0e-83123713445c@web.de>
In-Reply-To: <036792a4-0454-732a-8a0e-83123713445c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, Coccinelle <cocci@systeme.lip6.fr>

On Wed, Sep 09, 2020 at 08:52:19AM +0200, Markus Elfring wrote:
> I find it helpful to avoid typos (like the following) in the change description.
> 
> 
> > … Makfeile. …
> 
> … Makefile. …
> 
> 
> > … paasing …
> 
> … passing …
> 
> 
> > …, resuting …
> 
> …, resulting …
> 
> 
> > This patch modifies coccicheck …
> 

I did make those errors but I also rectified them. This is strange
because my commit message shows the rectified version.
Either way, I will send a v2. Thanks for pointing this out.

> Would an imperative wording be preferred for the commit message?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id4d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8#n151
> 
> Regards,
> Markus
