From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 26 Apr 2010 09:52:34 +0000
Subject: Re: [patch] i2o: trivial: cleanup some exit paths
Message-Id: <alpine.LNX.2.00.1004261152200.7579@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100423201717.GK29093@bicker>
In-Reply-To: <20100423201717.GK29093@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 23 Apr 2010, Dan Carpenter wrote:

> This is just a cleanup and doesn't change how the code works.
> 
> The original code had a mix of returns and gotos so I changed everything
> to just return directly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: Christoph Lameter <cl@linux-foundation.org>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
