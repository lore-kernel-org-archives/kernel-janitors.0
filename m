From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Sep 2012 17:31:05 +0000
Subject: Re: [staging-next] ozwpan: fix memcmp() test in oz_set_active_pd()
Message-Id: <20120904173104.GC19410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345393254-6060-1-git-send-email-tomas.winkler@intel.com>
In-Reply-To: <1345393254-6060-1-git-send-email-tomas.winkler@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Aug 19, 2012 at 07:20:54PM +0300, Tomas Winkler wrote:
> "addr" is a pointer so it's either 4 or 8 bytes, but actually we want
> to compare 6 bytes (ETH_ALEN).
> 
> As network stack already provides helper function
> is_zero_ether_addr() we use that instead of memcmp
> 
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Rupesh Gujare <rgujare@ozmodevices.com>
> ---

Generally I would frown on patch thievery but since the maintainer
asked you to then it's fine.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

