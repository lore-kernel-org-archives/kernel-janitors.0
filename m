From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Sun, 31 May 2020 12:32:27 +0000
Subject: Re: [PATCH] MIPS: ralink: bootrom: mark a function as __init to save some memory
Message-Id: <20200531123227.GA6039@alpha.franken.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531100603.597847-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200531100603.597847-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: john@phrozen.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, May 31, 2020 at 12:06:03PM +0200, Christophe JAILLET wrote:
> 'bootrom_setup()' is only called via 'postcore_initcall'.
> It can be marked as __init to save a few bytes of memory.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  arch/mips/ralink/bootrom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
