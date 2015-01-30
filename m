From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jan 2015 10:50:38 +0000
Subject: Re: [patch -mainline] fm10k: drop upper bits of VLAN ID
Message-Id: <20150130105038.GL6507@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150130084127.GE21357@mwanda>
In-Reply-To: <20150130084127.GE21357@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Alexander Duyck <alexander.h.duyck@intel.com>
Cc: kernel-janitors@vger.kernel.org, Linux NICS <linux.nics@intel.com>, e1000-devel@lists.sourceforge.net, Bruce Allan <bruce.w.allan@intel.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, John Ronciak <john.ronciak@intel.com>, netdev@vger.kernel.org

On Fri, Jan 30, 2015 at 11:41:27AM +0300, Dan Carpenter wrote:
> Static checkers complain that the shifts in "(vid << 4) >> 4" perfectly
> cancel each other out and the code is a no-op.  "vid" is a u16.  The
> comment says that the intention here is to drop the upper bits so I have
> added a cast to "u16" to do that.
> 
> Fixes: 401b5383c6c9 ('fm10k: Add support for configuring PF interface')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oh...  Rasmus Villemoes already fixed this.

regards,
dan carpenter

