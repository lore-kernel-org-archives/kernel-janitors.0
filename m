From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 05 Nov 2014 21:20:08 +0000
Subject: Re: [patch] mtd: off by one in INFTL_dumpVUchains()
Message-Id: <20141105212008.GW23619@ld-irv-0074>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141021080637.GA28426@mwanda>
In-Reply-To: <20141021080637.GA28426@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Tue, Oct 21, 2014 at 11:08:35AM +0300, Dan Carpenter wrote:
> The ->PUtable[] array has "->nb_blocks" number of elemetns so this
> comparison should be ">=" instead of ">".  Otherwise it could result in
> a minor read beyond the end of an array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd.git.

Brian
