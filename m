From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 20:05:00 +0000
Subject: Re: [patch] firmware: qemu_fw_cfg.c: potential unintialized variable
Message-Id: <20160414200500.GI4247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414093337.GD16549@mwanda>
 <20160414184005.GC7821@HEDWIG.INI.CMU.EDU>
 <20160414191253.GH4247@mwanda>
 <20160414193614.GE7821@HEDWIG.INI.CMU.EDU>
In-Reply-To: <20160414193614.GE7821@HEDWIG.INI.CMU.EDU>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gabriel L. Somlo" <somlo@cmu.edu>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Ah...  I see now.  You're right.  Thanks for the explanation.

On my config those functions are no-ops so the variable isn't
initialized.  If they were enabled then *probably* it wouldn't generate
a warning.

Probably just silencing the warning is the way to go though...  I bet
GCC optimizes it away.  Let me think about this some more...

regards,
dan carpenter

