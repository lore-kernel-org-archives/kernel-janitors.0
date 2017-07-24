From: Kees Cook <keescook@chromium.org>
Date: Mon, 24 Jul 2017 22:27:07 +0000
Subject: Re: [PATCH 07/11] mfd: Drop unnecessary static
Message-Id: <CAGXu5jKAO+9VjPnPWNUk3jH6iZwCy9+NPgYEQ+LFUdJciLJx0g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
 <1500149266-32357-8-git-send-email-Julia.Lawall@lip6.fr> <D2DCD2EA-E216-45D4-87F5-375C30F4AC76@gmail.com>
 <alpine.DEB.2.20.1707152254380.5105@hadrien> <20170724192026.GF32425@amd>
In-Reply-To: <20170724192026.GF32425@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Mark D Rustad <mrustad@gmail.com>, Tony Lindgren <tony@atomide.com>, kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-omap@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Jul 24, 2017 at 12:20 PM, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> > > Drop static on a local variable, when the variable is initialized before
>> > > any possible use.  Thus, the static has no benefit.
>
> Actually... it has possible other benefit -- saving stack space. I've
> used static for that purpose before. So ... careful with the
> automation.

This means any functions like this must not be thread safe, though...

-Kees

-- 
Kees Cook
Pixel Security
