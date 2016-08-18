From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Date: Thu, 18 Aug 2016 01:13:39 +0000
Subject: Re: [PATCH] ARM: cpuidle: Fix error return code
Message-Id: <6453323.GiPU6Gidg3@vostro.rjw.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470920550-21625-1-git-send-email-christophe.jaillet@wanadoo.fr> <57B471A9.8060103@linaro.org>
In-Reply-To: <57B471A9.8060103@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wednesday, August 17, 2016 04:16:09 PM Daniel Lezcano wrote:
> On 08/11/2016 03:02 PM, Christophe JAILLET wrote:
> > We know that 'ret = 0' because it has been tested a few lines above.
> > So, if 'kzalloc' fails, 0 will be returned instead of an error code.
> > Return -ENOMEM instead.
> > 
> > Fixes: a0d46a3dfdc3 ("ARM: cpuidle: Register per cpuidle device")
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Applied, thanks !

Daniel, I've applied it too and earlier.

Thanks,
Rafael

