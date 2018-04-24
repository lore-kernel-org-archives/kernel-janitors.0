From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 24 Apr 2018 05:45:29 +0000
Subject: Re: [PATCH v2] mfd: tps65911-comparator: Fix an off by one bug
Message-Id: <20180424054529.2gv2l24muxzh2n6b@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180420083909.66a6t63s5q6vpwp7@dell>
 <20180420090910.GA26071@mwanda>
 <20180423064417.2e2ng3su23w4i7hx@dell>
 <20180423102717.tmx7mlk2yzovnpkh@mwanda>
In-Reply-To: <20180423102717.tmx7mlk2yzovnpkh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 23 Apr 2018, Dan Carpenter wrote:

> I really don't want authorship credit for a patch that does:
> 
> #define COMP1 0
> #define COMP2 1
> 
> It just makes me itch to look at it...

As I say, I get where you're coming from, but it was the decision made
by the H/W engineers.  Doesn't mean it's not the correct thing to do
from a S/W POV.

If you're not happy putting your SOB on the patch, I'll draft it and
sign it off.  /me has no shame!

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
