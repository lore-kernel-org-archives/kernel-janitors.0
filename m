From: Jason Cooper <jason@lakedaemon.net>
Date: Sun, 24 Nov 2013 03:56:04 +0000
Subject: Re: [patch] bus: mvebu-mbus: potential forever loop in mvebu_mbus_init()
Message-Id: <20131124035604.GZ29241@titan.lakedaemon.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113075024.GH25541@elgon.mountain>
In-Reply-To: <20131113075024.GH25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 13, 2013 at 10:50:24AM +0300, Dan Carpenter wrote:
> "of_id->compatible" is an array and not a pointer so it can never be
> NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I'm not able to compile this.

Compile tested with mvebu_defconfig for ARCH=arm.  Applied to
mvebu/drivers

thx,

Jason.
