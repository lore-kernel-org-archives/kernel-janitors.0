From: Joerg Roedel <joerg.roedel@amd.com>
Date: Mon, 02 Jul 2012 10:15:20 +0000
Subject: Re: [patch 1/2 -resend] dma-debug: debugfs_create_bool() takes a u32 pointer
Message-Id: <20120702101520.GC2558@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120627085800.GA3007@mwanda>
 <20120627090854.GS31212@elgon.mountain>
In-Reply-To: <20120627090854.GS31212@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Neil Horman <nhorman@tuxdriver.com>, Jakub Kicinski <kubakici@wp.pl>, Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 27, 2012 at 12:08:55PM +0300, Dan Carpenter wrote:
> Even though it has "bool" in the name, you have pass a u32 pointer to
> debugfs_create_bool().  Otherwise you get memory corruption in
> write_file_bool().  Fortunately in this case the corruption happens in
> an alignment hole between variables so it doesn't cause any problems.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied both, thanks Dan.


