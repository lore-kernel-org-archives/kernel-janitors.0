From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Apr 2012 12:06:47 +0000
Subject: Re: [patch 1/2] Btrfs: double unlock bug in error handling
Message-Id: <20120418120647.GA27101@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120418065903.GE12831@elgon.mountain>
 <4F8EA5AA.2080202@jan-o-sch.net>
In-Reply-To: <4F8EA5AA.2080202@jan-o-sch.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Schmidt <list.btrfs@jan-o-sch.net>
Cc: Chris Mason <chris.mason@oracle.com>, Jeff Mahoney <jeffm@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 18, 2012 at 01:29:46PM +0200, Jan Schmidt wrote:
> On 18.04.2012 08:59, Dan Carpenter wrote:
> I think the correct way to fix this is:
> 

Yeah.  I considered both ways, but I chose the one which makes the
tools happy.  Which is the wrong choice, because taking a pointless
lock is wrong even on the slow path and we should improve the tools.

I'll resend.

regards,
dan carpenter

