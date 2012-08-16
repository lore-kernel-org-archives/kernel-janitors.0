From: Jeff Garzik <jgarzik@pobox.com>
Date: Thu, 16 Aug 2012 15:23:44 +0000
Subject: Re: [patch] [SCSI] mvsas: fix a && vs & bug
Message-Id: <502D1080.6070307@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120816110401.GA12318@elgon.mountain>
In-Reply-To: <20120816110401.GA12318@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, Xiangliang Yu <yuxiangl@marvell.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/16/2012 07:04 AM, Dan Carpenter wrote:
> The "1 << (slot_idx % 32)" condition is always true.  The intent was to
> test a bit field here using bitwise AND.  We do the test correctly a few
> lines later in the do while loop.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jeff Garzik <jgarzik@redhat.com>



