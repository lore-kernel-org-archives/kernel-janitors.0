From: David Miller <davem@davemloft.net>
Date: Tue, 09 Dec 2014 21:13:24 +0000
Subject: Re: [PATCH 14/20] chelsio: fix misspelling of current function in string
Message-Id: <20141209.161324.925660433643018767.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
	<1417980062-25151-15-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-15-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun,  7 Dec 2014 20:20:56 +0100

> Replace a misspelled function name by %s and then __func__.
> 
> This was done using Coccinelle, including the use of Levenshtein distance,
> as proposed by Rasmus Villemoes.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
