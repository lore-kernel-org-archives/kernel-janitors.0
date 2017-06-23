From: James Cameron <quozl@laptop.org>
Date: Fri, 23 Jun 2017 20:22:56 +0000
Subject: Re: [PATCH] libertas: Fix lbs_prb_rsp_limit_set()
Message-Id: <20170623202256.GB30867@us.netrek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623151738.qxncismrvd4yzzfr@mwanda>
In-Reply-To: <20170623151738.qxncismrvd4yzzfr@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, libertas-dev@lists.infradead.org

On Fri, Jun 23, 2017 at 06:17:38PM +0300, Dan Carpenter wrote:
> The kstrtoul() test was reversed so this always returned -ENOTSUPP.
> 
> Fixes: 27d7f47756f4 ("net: wireless: replace strict_strtoul() with kstrtoul()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: James Cameron <quozl@laptop.org>

-- 
James Cameron
http://quozl.netrek.org/
