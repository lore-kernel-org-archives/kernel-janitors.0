From: Tejun Heo <tj@kernel.org>
Date: Mon, 11 May 2020 14:27:01 +0000
Subject: Re: [PATCH] workqueue: Fix an use after free in init_rescuer()
Message-Id: <20200511142701.GC16815@mtj.duckdns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508150740.GA415175@mwanda>
In-Reply-To: <20200508150740.GA415175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sean Fu <fxinrong@gmail.com>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, May 08, 2020 at 06:07:40PM +0300, Dan Carpenter wrote:
> We need to preserve error code before freeing "rescuer".
> 
> Fixes: f187b6974f6df ("workqueue: Use IS_ERR and PTR_ERR instead of PTR_ERR_OR_ZERO.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to wq/for-5.8. Thank you.

-- 
tejun
