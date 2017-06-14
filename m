From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Wed, 14 Jun 2017 08:42:53 +0000
Subject: Re: [PATCH] thunderbolt: Fix reset response_type
Message-Id: <20170614084253.GZ3187@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614074720.GA29175@elgon.mountain>
In-Reply-To: <20170614074720.GA29175@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 10:47:21AM +0300, Dan Carpenter wrote:
> There is a mistake here where we accidentally use sizeof(TB_CFG_PKG_RESET)
> instead of just TB_CFG_PKG_RESET.  The size of an int is 4 so it's the
> same as TB_CFG_PKG_NOTIFY_ACK.
> 
> Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reliable")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch!

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
