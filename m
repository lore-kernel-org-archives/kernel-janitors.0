From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Thu, 14 Apr 2016 10:01:35 +0000
Subject: Re: [patch] mfd: wm8400-core: signedness bug in wm8400_reg_read()
Message-Id: <20160414100135.GS31814@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414094055.GC16891@mwanda>
In-Reply-To: <20160414094055.GC16891@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 14, 2016 at 12:40:55PM +0300, Dan Carpenter wrote:
> This is harmless because the function is not called, but we're trying to
> return negative error codes so the function needs to return an int
> instead of a u16.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

That patch looks fine, but the function appears to be completely
unused, perhaps just a patch to remove it would be better?

Thanks,
Charles
