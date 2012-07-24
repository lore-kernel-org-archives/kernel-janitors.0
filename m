From: John David Anglin <dave.anglin@bell.net>
Date: Tue, 24 Jul 2012 21:08:04 +0000
Subject: Re: [next:akpm 129/309] net/core/sock.c:274:36: error: initializer element is not constant
Message-Id: <BLU0-SMTP6C7CFCFF734FE10A39B6E97DC0@phx.gbl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120722163058.GB13376@localhost> <20120723111619.GT9222@suse.de> <1343042420.3027.11.camel@dabdike.int.hansenpartnership.com> <20120723114258.GV9222@suse.de> <20120723122905.GA22476@localhost> <BLU0-SMTP2254F8872DDE5FA6035CDE97DD0@phx.gbl> <20120724074844.GA9519@localhost>
In-Reply-To: <20120724074844.GA9519@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Mel Gorman <mgorman@suse.de>, James Bottomley <James.Bottomley@HansenPartnership.com>, kernel-janitors@vger.kernel.org, Kyle McMartin <kyle@parisc-linux.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>

On 24-Jul-12, at 3:48 AM, Fengguang Wu wrote:

> Here is the line in sock.i:
>
> struct static_key memalloc_socks = ((struct static_key) { .enabled =  
> ((atomic_t) { (0) }) });


The above line contains two compound literals.  It also uses a  
designated initializer
to initialize the field enabled.  A compound literal is not a constant  
expression.

The location of the above statement isn't fully clear, but if a  
compound literal occurs
outside the body of a function, the initializer list must consist of  
constant expressions.

Removing "(atomic_t)" from the define results in a constant expression.

Test case:

typedef struct { long enabled; } atomic_t;
struct static_key { atomic_t enabled; int x; };
struct static_key memalloc_socks = ((struct static_key) { .enabled =  
((atomic_t) { (0) }) });

Dave
--
John David Anglin	dave.anglin@bell.net



