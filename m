From: David Miller <davem@davemloft.net>
Date: Thu, 19 Oct 2017 12:05:07 +0000
Subject: Re: [PATCH 2/2 net-next] thunderbolt: Right shifting to zero bug in tbnet_handle_packet()
Message-Id: <20171019.130507.171332903320471229.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171013112959.sc2pwazrpk7fxbtw@mwanda>
        <20171017123301.z6heqexdlo6lc52b@mwanda>
In-Reply-To: <20171017123301.z6heqexdlo6lc52b@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: michael.jamet@intel.com, amir.jer.levy@intel.com, mika.westerberg@linux.intel.com, yehezkel.bernat@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Oct 2017 15:33:01 +0300

> There is a problem when we do:
> 
> 	sequence = pkg->hdr.length_sn & TBIP_HDR_SN_MASK;
> 	sequence >>= TBIP_HDR_SN_SHIFT;
> 
> TBIP_HDR_SN_SHIFT is 27, and right shifting a u8 27 bits is always
> going to result in zero.  The fix is to declare these variables as u32.
> 
> Fixes: e69b6c02b4c3 ("net: Add support for networking over Thunderbolt cable")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
