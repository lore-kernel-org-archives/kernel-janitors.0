From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Fri, 10 May 2013 13:11:54 +0000
Subject: Re: [patch] mtd: denali_dt: harmless case of testing the wrong variable
Message-Id: <1368191514.26780.164.camel@sauron.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130401062151.GA5197@longonot.mountain>
In-Reply-To: <20130401062151.GA5197-dZEljifmRObu9KfB+GxooP8+0UxHXcjY@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bill Pemberton <wfp5p-4Ng6DfrEGID2fBVCVOL8/A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>

On Mon, 2013-04-01 at 09:21 +0300, Dan Carpenter wrote:
> There is a warning message that can't be printed because we test the
> wrong variable.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, but there is already a similar fix for this in upstream:

commit 6c67050ab108bcce2576fa1d7a0557eb0376520a
Author: Sachin Kamat <sachin.kamat@linaro.org>

-- 
Best Regards,
Artem Bityutskiy

