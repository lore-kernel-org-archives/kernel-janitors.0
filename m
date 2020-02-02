From: "Maciej W. Rozycki" <macro@linux-mips.org>
Date: Sun, 02 Feb 2020 19:12:13 +0000
Subject: Re: [PATCH] defxx: Fix a sentinel at the end of a 'eisa_device_id' structure
Message-Id: <alpine.LFD.2.21.2002021858330.683661@eddie.linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200202142341.22124-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200202142341.22124-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2 Feb 2020, Christophe JAILLET wrote:

> 'struct eisa_device_id' must be ended by an empty string, not a NULL
> pointer. Otherwise, a NULL pointer dereference may occur in
> 'eisa_bus_match()'.

 Umm, that's weird code there in `eisa_bus_match' (I do hope at least GCC 
optimises the `strlen' away nowadays and checks for the character pointed 
being null instead), but as usually with old stuff let's keep changes to 
the minimum.  So:

Acked-by: Maciej W. Rozycki <macro@linux-mips.org>

 Thanks for the fix!

  Maciej
