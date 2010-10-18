From: Julia Lawall <julia@diku.dk>
Date: Mon, 18 Oct 2010 20:02:53 +0000
Subject: Re: [PATCH 0/3] Use kasprintf
Message-Id: <Pine.LNX.4.64.1010182202260.22877@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287341311-11161-1-git-send-email-julia@diku.dk>
 <4CBC8D4E.90008@grupopie.com>
In-Reply-To: <4CBC8D4E.90008@grupopie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paulo Marques <pmarques@grupopie.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 18 Oct 2010, Paulo Marques wrote:

> Julia Lawall wrote:
> > These patches convert a sequence of kmalloc and memcpy to use kasprintf
> > instead.
> 
> Aren't these patches just a more convoluted way of doing a kstrdup?
> 
> I would imagine that a kasprintf would make more sense when the format
> string is more complex than "%s", or am I missing something?

They have all already been changed to either kmemdup or kstrdup.

thanks,
julia
