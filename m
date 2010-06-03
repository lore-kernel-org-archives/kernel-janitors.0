From: Michal Marek <mmarek@suse.cz>
Date: Thu, 03 Jun 2010 09:51:43 +0000
Subject: Re: [PATCH 3/4] Add scripts/coccinelle/kzalloc-simple.cocci
Message-Id: <4C077B2F.8010204@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk> <1273508667-5152-4-git-send-email-npalix@diku.dk>
In-Reply-To: <1273508667-5152-4-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>

On 10.5.2010 18:24, Nicolas Palix wrote:
> +@script:python depends on org@
> +p << r.p;
> +x << r.x;
> +@@
> +
> +msg="%s" % (x)
> +msg_safe=msg.replace("[","@(").replace("]",")")
> +coccilib.org.print_todo(p[0], msg_safe)
> +
> +@script:python depends on report@
> +p << r.p;
> +x << r.x;
> +@@
> +
> +msg="WARNING: kzalloc should be used for %s, instead of kmalloc/memset" % (x)
> +coccilib.report.print_report(p[0], msg_safe)

msg_safe is not defined in this scriptlet, I'm only getting

Traceback (most recent call last):
  File "<string>", line 5, in <module>
NameError: name 'msg_safe' is not defined

Michal
