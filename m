From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Sep 2016 08:47:08 +0000
Subject: Re: [PATCH 3/5] GPU-DRM-nouveau: Delete unnecessary braces
Message-Id: <20160921084708.GM13620@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
 <74cc2e34-cb5f-e3c9-e6cd-aa24ed3529e3@users.sourceforge.net>
In-Reply-To: <74cc2e34-cb5f-e3c9-e6cd-aa24ed3529e3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, trivial@kernel.org, Julia Lawall <julia.lawall@lip6.fr>

The original style was correct, the new style is wrong. Multi-line
indents get curly braces for readability.

regards,
dan carpenter

