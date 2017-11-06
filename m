From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Nov 2017 12:59:05 +0000
Subject: Re: [PATCH] backlight: ili922x: remove redundant variable len
Message-Id: <20171106125905.ww4kwfjrv5uz5pqf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171105115326.5276-1-colin.king@canonical.com>
In-Reply-To: <20171105115326.5276-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Nov 06, 2017 at 01:06:46PM +0100, walter harms wrote:
> >>       tbuf[1] = set_tx_byte((value & 0xFF00) >> 8);
> >>
> 
> nitpick:
>  value is u16 so value >> 8 is sufficient

It's the same, yes, but the current code is more readable.

regards,
dan carpenter

