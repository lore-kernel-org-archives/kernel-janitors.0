From: Ondrej Zajicek <santiago@crfreenet.org>
Date: Tue, 22 Jul 2008 08:34:36 +0000
Subject: Re: [Linux-fbdev-devel] [PATCH 6/7] drivers/video: Release mutex in error handling code
Message-Id: <20080722083436.GB10834@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807210958320.24625@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807210958320.24625@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-fbdev-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, adaplas@gmail.com

On Mon, Jul 21, 2008 at 09:58:55AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The mutex is released on a successful return, so it would seem that it
> should be released on an error return as well.
... 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Ondrej Zajicek <santiago@crfreenet.org>

-- 
Elen sila lumenn' omentielvo

Ondrej 'SanTiago' Zajicek (email: santiago@crfreenet.org)
OpenPGP encrypted e-mails preferred (KeyID 0x11DEADC3, wwwkeys.pgp.net)
"To err is human -- to blame it on a computer is even more so."
