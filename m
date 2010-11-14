From: Dan Carpenter <error27@gmail.com>
Date: Sun, 14 Nov 2010 20:29:05 +0000
Subject: Re: [PATCH] fs: jffs2: fix error value sign
Message-Id: <20101114202905.GA21614@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289765320-6071-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1289765320-6071-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org

On Sun, Nov 14, 2010 at 11:08:39PM +0300, Vasiliy Kulikov wrote:
> do_verify_xattr_datum(), do_load_xattr_datum(), load_xattr_datum()
> and verify_xattr_ref() should return negative value on error.
> Sometimes they return EIO that is positive.  Change this to -EIO.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
>  This driver is not compilable, so the patch is not tested.
> 

It compiles.

regards,
dan carpenter


