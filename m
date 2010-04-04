From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 04 Apr 2010 10:22:29 +0000
Subject: Re: [PATCH 3/3] sound/pci: Eliminate use after free
Message-Id: <s5hochzh5zu.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1004021447390.17695@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1004021447390.17695@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Fri, 2 Apr 2010 14:47:59 +0200 (CEST),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Use the call to snd_card_free in the error handling code at the end of the
> function, as in the other error cases.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression E,E2;
> @@
> 
> snd_card_free(E)
> ...
> (
>   E = E2
> |
> * E
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied now.  Thanks.


Takashi
