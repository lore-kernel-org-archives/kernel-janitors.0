From: Sasha Levin <levinsasha928@gmail.com>
Date: Sun, 04 Nov 2012 14:59:18 +0000
Subject: Re: [PATCH 0/8] drop if around WARN_ON
Message-Id: <CA+1xoqd-UQXg0nuE1t5ayYY1Ow81er2mHUFUow=mfcwzkCPW5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351974625-10282-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Julia,

On Sat, Nov 3, 2012 at 4:30 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> These patches convert a conditional with a simple test expression and a
> then branch that only calls WARN_ON(1) to just a call to WARN_ON, which
> will test the condition.
>
> // <smpl>
> @@
> expression e;
> @@
>
> (
> if(<+...e(...)...+>) WARN_ON(1);
> |
> - if (e) WARN_ON(1);
> + WARN_ON(e);
> )// </smpl>

So this deals with WARN_ON(), are you considering doing the same for
the rest of it's friends?


Thanks,
Sasha
