From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Fri, 15 Apr 2016 15:15:31 +0000
Subject: Re: [patch v2] mfd: wm8400-core: delete wm8400_reg_read()
Message-Id: <20160415151531.GT31814@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414100135.GS31814@localhost.localdomain>
 <20160415144418.GA8953@mwanda>
In-Reply-To: <20160415144418.GA8953@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee.jones@linaro.org>, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Fri, Apr 15, 2016 at 05:44:18PM +0300, Dan Carpenter wrote:
> There was a static checker warning in wm8400_reg_read() because we were
> returning u16 and that can't hold the negative error codes.  The
> function isn't used, so let's just delete it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
