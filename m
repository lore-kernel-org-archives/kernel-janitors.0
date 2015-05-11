From: Jesper Nilsson <jesper.nilsson@axis.com>
Date: Mon, 11 May 2015 11:21:40 +0000
Subject: Re: [PATCH] cris: arch-v32: gpio: Use kzalloc instead of kmalloc/memset
Message-Id: <20150511112140.GY11161@axis.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430488699-10878-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1430488699-10878-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jespern@axis.com>, linux-cris-kernel <linux-cris-kernel@axis.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, May 01, 2015 at 03:58:19PM +0200, Christophe Jaillet wrote:
> Turn a kmalloc/memset into an equivalent kzalloc.
> Doing so also move the zero'ing of the memory outside of a mutex.

Agreed, thanks!

> Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
