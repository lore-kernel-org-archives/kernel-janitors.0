From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Sep 2014 11:08:03 +0000
Subject: Re: [PATCH 1/6] Coccinelle: Semantic patch for replacing puts with putc
Message-Id: <5412D413.3080404@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1410513954-28909-1-git-send-email-linux@rasmusvillemoes.dk>
 <1410513954-28909-2-git-send-email-linux@rasmusvillemoes.dk>
In-Reply-To: <1410513954-28909-2-git-send-email-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> Using seq_puts to write a one-character string is suboptimal,
> since puts has to call strlen().

Are there any more functions which work with such strings in a similar way?
Would it make sense to look also at other function names?

Regards,
Markus
