From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 25 Nov 2008 16:00:25 +0000
Subject: Re: [PATCH 1/5] arch/mips/alchemy: change strict_strtol to
Message-Id: <20081125160025.GA18083@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811251412010.11897@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811251412010.11897@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 25, 2008 at 02:12:32PM +0100, Julia Lawall wrote:

> Since memsize is unsigned, it would seem better to use strict_strtoul that
> strict_strtol.

Thanks, applied.

  Ralf
