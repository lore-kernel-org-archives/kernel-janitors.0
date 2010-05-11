From: Andy Isaacson <adi@hexapodia.org>
Date: Tue, 11 May 2010 02:14:16 +0000
Subject: Re: [PATCH 0/4] Add a Coccinelle front-end script
Message-Id: <20100511021416.GA7125@hexapodia.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1273508667-5152-1-git-send-email-npalix@diku.dk>
In-Reply-To: <1273508667-5152-1-git-send-email-npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: Randy Dunlap <rdunlap@xenotime.net>, Roland Dreier <rdreier@cisco.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Julia Lawall <julia@diku.dk>, Gilles Muller <Gilles.Muller@lip6.fr>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, cocci@diku.dk, Wolfram Sang <w.sang@pengutronix.de>, Kernel Janitors <kernel-janitors@vger.kernel.org>

On Mon, May 10, 2010 at 06:24:23PM +0200, Nicolas Palix wrote:
> New targets are added (coccicheck-<mode>) to call the 'coccinelle.sh'
> front-end in the 'scripts' directory with the <mode> argument.
> 
> Four modes are defined: report, patch, context, and org.

Please check-in this write-up somewhere (Documentation/README.coccinelle
perhaps?) along with information about how to get the required tools.
(Are they pacakged in Debian and/or Fedora?  What versions are the
scripts tested against?)

Also I'd like to see a short example of how to use the framework.  I've
read Val's spatch article (http://lwn.net/Articles/315686/) and it's
still a bit of a black art to me.

Thanks for the work!

-andy
