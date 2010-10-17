From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Oct 2010 18:44:58 +0000
Subject: Re: [PATCH 2/7] drivers/staging: Return -ENOMEM on memory allocation
Message-Id: <Pine.LNX.4.64.1010172043320.394@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287147610-8041-2-git-send-email-julia@diku.dk> <4CB86431.5000305@bfs.de>
 <Pine.LNX.4.64.1010152157440.29421@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1010152157440.29421@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Fri, 15 Oct 2010, Julia Lawall wrote:

> On Fri, 15 Oct 2010, walter harms wrote:
> 
> > This looks like a case for kasprintf().
> 
> OK, I will take a look at it.

Instead, I have found some other occurrences of kmalloc + memcpy that 
could be kasprintf, so I have done them all in another patch series, with 
the subject "Use kasprintf".

julia
