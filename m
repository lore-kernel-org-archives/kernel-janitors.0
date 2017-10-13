From: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Fri, 13 Oct 2017 11:42:10 +0000
Subject: Re: [PATCH] thunderbolt: Fix some right shifting to zero bugs
Message-Id: <20171013114210.GE2761@lahna.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171013112959.sc2pwazrpk7fxbtw@mwanda>
In-Reply-To: <20171013112959.sc2pwazrpk7fxbtw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, Yehezkel Bernat <yehezkel.bernat@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 13, 2017 at 02:29:59PM +0300, Dan Carpenter wrote:
> The problematic code looks like this:
> 
> 	res_seq = res_hdr->xd_hdr.length_sn & TB_XDOMAIN_SN_MASK;
> 	res_seq >>= TB_XDOMAIN_SN_SHIFT;
> 
> TB_XDOMAIN_SN_SHIFT is 27, and right shifting a u8 27 bits is always
> going to result in zero.  The fix is to declare these variables as u32.
> 
> Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")

I think this requires two patches as the drivers/net/thunderbolt.c is
added by another commit.

Also please CC netdev@vger.kernel.org and David Miller as the patches
are in his net-next tree.

The fixes themselves look good, though.
