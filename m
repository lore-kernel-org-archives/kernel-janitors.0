From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Sep 2016 10:58:56 +0000
Subject: Re: [PATCH 2/4] GPU-DRM-TILCDC: Return directly after a failed kfree_table_init() in tilcdc_convert_
Message-Id: <20160922105856.GO13620@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <e74ecf81-1ddc-2583-3a4b-48735e2898c4@users.sourceforge.net>
In-Reply-To: <e74ecf81-1ddc-2583-3a4b-48735e2898c4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

This one is actually a bug fix...  But finding bug fixes in this series
is like looking for kernels of edible corn in piles of monkey poop.

Also, classic "One Err" bug.

regards,
dan carpenter

