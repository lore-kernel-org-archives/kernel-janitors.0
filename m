From: "Perez-Gonzalez, Inaky" <inaky.perez-gonzalez@intel.com>
Date: Fri, 16 Dec 2011 22:09:29 +0000
Subject: RE: [patch] wimax/i2400m: remove an unused variable
Message-Id: <3A78FAA0EC814D4B8ECC99B3AB32B332012E56@ORSMSX105.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111216102242.GC4287@elgon.mountain>
In-Reply-To: <20111216102242.GC4287@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wimax <linux-wimax@intel.com>, "wimax@linuxwimax.org" <wimax@linuxwimax.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> Subject: [patch] wimax/i2400m: remove an unused variable
> 
> "result" isn't used.  We ignore errors here because there is not much
> we can do about them.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This is an ACK or a NAK depending on if you want to keep the reporting
with debug enabled or not. It is not so difficult to add back if needed, 
so I tend to ACK.

Thank you,
