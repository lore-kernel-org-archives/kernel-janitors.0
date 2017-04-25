From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Apr 2017 12:32:50 +0000
Subject: Re: [PATCH 3/3] HSI: omap_ssi: Delete an error message for a failed memory allocation in ssi_add_con
Message-Id: <20170425123250.ipltfpgcgbtk6h3g@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
 <e6102bce-0b27-68e6-8247-f87851f7f9b9@users.sourceforge.net>
 <20170425115446.GC7926@amd>
In-Reply-To: <20170425115446.GC7926@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

1) That allocation will never fail in real life so it's dead code.
2) kmalloc and friends already have much better builtin in error
   messages so it's useless.
3) There is a small memory savings from removing it.

I'm not saying you should apply the patch, I'm just saying that these
messages are pointless and detrimental.

regards,
an carpenter


