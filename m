From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 10 Mar 2016 12:57:24 +0000
Subject: Re: libertas: fix an error code in probe
Message-Id: <20160310125724.879A060DB3@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160308120408.GA28684@mwanda>
References: <20160308120408.GA28684@mwanda>
In-Reply-To: <20160308120408.GA28684@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


> We accidentally return success instead of a negative error code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
