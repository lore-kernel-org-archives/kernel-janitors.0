From: David Miller <davem@davemloft.net>
Date: Tue, 09 Dec 2014 21:14:38 +0000
Subject: Re: [PATCH 5/20] isdn: fix misspelling of current function in string
Message-Id: <20141209.161438.1929426728064530302.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
	<1417980062-25151-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: isdn@linux-pingi.de, kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun,  7 Dec 2014 20:20:47 +0100

> Replace a misspelled function name by %s and then __func__.
> 
> In the first case, the print is just dropped, because kmalloc itself does
> enough error reporting.
> 
> This was done using Coccinelle, including the use of Levenshtein distance,
> as proposed by Rasmus Villemoes.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
