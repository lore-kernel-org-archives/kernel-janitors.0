From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Feb 2019 18:31:54 +0000
Subject: Re: [PATCH -next] platform/chrome: Fix off-by-one error in wilco_ec/debugfs.c
Message-Id: <20190221070704.GD1711@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220215826.44366-1-ncrews@chromium.org>
 <a0cf4649-e06f-aded-55ad-893560c2414a@collabora.com>
 <CAHX4x87KP9QsnX-vAwyEs45tXngbiSSq+vrByj01S-LpUdO40g@mail.gmail.com>
In-Reply-To: <CAHX4x87KP9QsnX-vAwyEs45tXngbiSSq+vrByj01S-LpUdO40g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Crews <ncrews@chromium.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>

On Wed, Feb 20, 2019 at 03:15:18PM -0700, Nick Crews wrote:
> Fixing something after it's already in the tree was a new
> process for me, so I tried to copy other people's examples. Please
> let me know if there's anything else I should do something different
> next time.

I seldom mention how much I like Reported-by tags because it makes me
seem needy...  Also in this case it doesn't matter because it's going to
get folded into the original patch so it's going to be lost anyway.  But
since you're asking process questions, the Reported-by cookie is nice.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
