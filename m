From: David Miller <davem@davemloft.net>
Date: Thu, 19 Oct 2017 12:04:50 +0000
Subject: Re: [PATCH 1/2 v2 net-next] thunderbolt: Fix a couple right shifting to zero bugs
Message-Id: <20171019.130450.2201375945281744526.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171013112959.sc2pwazrpk7fxbtw@mwanda>
        <20171017123217.p3ctmptbrm75ys46@mwanda>
In-Reply-To: <20171017123217.p3ctmptbrm75ys46@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, mika.westerberg@linux.intel.com, yehezkel.bernat@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Oct 2017 15:32:17 +0300

> The problematic code looks like this:
> 
> 	res_seq = res_hdr->xd_hdr.length_sn & TB_XDOMAIN_SN_MASK;
> 	res_seq >>= TB_XDOMAIN_SN_SHIFT;
> 
> TB_XDOMAIN_SN_SHIFT is 27, and right shifting a u8 27 bits is always
> going to result in zero.  The fix is to declare these variables as u32.
> 
> Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
