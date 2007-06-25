From: Johannes Weiner <hannes-kernel@saeurebad.de>
Date: Mon, 25 Jun 2007 12:13:16 +0000
Subject: [KJ] Re: [PATCH]is_power_of_2-ufs/super.c
Message-Id: <20070625121316.GA19544@saeurebad.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1181808559.2474.9.camel@merlin.linuxcoe.com>
In-Reply-To: <1181808559.2474.9.camel@merlin.linuxcoe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vignesh babu <vignesh.babu@wipro.com>
Cc: daniel.pirkl@email.cz, dushistov@mail.ru, linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>

Hi,

On Thu, Jun 14, 2007 at 01:39:18PM +0530, vignesh babu wrote:
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2

You might want to run

	egrep -R '([a-zA-Z0-9_.>]+) *& *\(\1 *- *1\)' /usr/src/linux

This does not match if the check is broken into multiple lines, though.
Still, 66 matches so far. Perhaps a big patch that removes most of these
occurrences would be more appropriate.

	Hannes
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
