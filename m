From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Mon, 19 Oct 2015 10:19:07 +0000
Subject: Re: [patch] mfd: arizona: signedness bug in arizona_runtime_suspend()
Message-Id: <20151019101907.GA4514@ck-lbox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151019101805.GE26688@mwanda>
In-Reply-To: <20151019101805.GE26688@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 19, 2015 at 01:18:05PM +0300, Dan Carpenter wrote:
> The "jd_active" variable needs to be signed for the error handling to
> work.
> 
> Fixes: 143e5887ae57 ('mfd: arizona: factor out checking of jack detection state')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

thanks,
Charles
