From: Joe Perches <joe@perches.com>
Date: Thu, 11 Jun 2020 18:01:41 +0000
Subject: Re: [PATCH] drm/bridge: make array frs_limits static, makes object smaller
Message-Id: <17564b0632ef8ca6a64023fe430d69e861f252f1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200611133924.923774-1-colin.king@canonical.com>
In-Reply-To: <20200611133924.923774-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2020-06-11 at 14:39 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array frs_limits on the stack but instead make it
> static. Makes the object code smaller by 123 bytes
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   23456	   5712	     64	  29232	   7230	drivers/gpu/drm/bridge/tc358768.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   23333	   5712	     64	  29109	   71b5	drivers/gpu/drm/bridge/tc358768.o
> 
> (gcc version 9.3.0, amd64)

It's curious that the data size didn't change.

Perhaps you should make sure you do not compile
with allyesconfig when you show these change.

For instance: x86-64 defconfig with this bridge
enabled:

$ size drivers/gpu/drm/bridge/tc358768.o
   text	   data	    bss	    dec	    hex	filename
   9423	    300	      0	   9723	   25fb	drivers/gpu/drm/bridge/tc358768.o
