From: Joe Perches <joe@perches.com>
Date: Wed, 08 Apr 2020 09:49:04 +0000
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in ingenic_drm_probe()
Message-Id: <acc040a1c5bec74cb78e2ee7e859c6989647c343.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
In-Reply-To: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2020-04-08 at 12:42 +0300, Dan Carpenter wrote:
> On Mon, Apr 06, 2020 at 07:48:52PM +0200, Christophe JAILLET wrote:
> > Nevertheless, I wrote another script (see below), which triggers ~2800 times
> > in ./drivers only.
> > Some are false positives, but most look valid.
> 
> I did a quick grep and you're right there are a ton of these!

Quite a lot of them use pr_cont too.

Anyway, try this:
https://lore.kernel.org/lkml/8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com/
