From: Bing Zhao <bzhao@marvell.com>
Date: Fri, 24 Jun 2011 19:32:36 +0000
Subject: RE: [patch] mwifiex: restore handling of NULL parameters
Message-Id: <477F20668A386D41ADCC57781B1F704307FF9744E8@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110624133335.GP14591@shale.localdomain>
In-Reply-To: <20110624133335.GP14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Amitkumar Karwar <akarwar@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Yogesh Powar <yogeshp@marvell.com>, Marc Yang <yangyang@marvell.com>, "open list:NETWORKING [WIREL..." <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

> Prior to a5ffddb70c5cab "mwifiex: remove casts of void pointers" the
> code assumed that the data_buf parameter could be a NULL pointer.
> The patch preserved some NULL checks but not consistently, so there
> was a potential for NULL dereferences and it changed the behavior.

Thanks for the catch!

> This patch restores the original behavior.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Bing Zhao <bzhao@marvell.com>

Best regards,
Bing
 
