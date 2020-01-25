From: Al Viro <viro@zeniv.linux.org.uk>
Date: Sat, 25 Jan 2020 16:32:51 +0000
Subject: Re: [PATCH] fs/adfs: bigdir: Fix an error code in adfs_fplus_read()
Message-Id: <20200125163251.GL23230@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200124101537.z6n242eovocfbdha@kili.mountain>
 <20200125092930.GQ25745@shell.armlinux.org.uk>
In-Reply-To: <20200125092930.GQ25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Kate Stewart <kstewart@linuxfoundation.org>, Enrico Weigelt <info@metux.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jan 25, 2020 at 09:29:30AM +0000, Russell King - ARM Linux admin wrote:
> On Fri, Jan 24, 2020 at 01:15:37PM +0300, Dan Carpenter wrote:
> > This code accidentally returns success, but it should return the
> > -EIO error code from adfs_fplus_validate_header().
> > 
> > Fixes: d79288b4f61b ("fs/adfs: bigdir: calculate and validate directory checkbyte")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Good catch.
> 
> Acked-by: Russell King <rmk+kernel@armlinux.org.uk>
> 
> Al, please apply, thanks.

Applied and pushed out.
