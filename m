From: Mike Marciniszyn <mike.marciniszyn@qlogic.com>
Date: Thu, 26 Jan 2012 13:20:51 +0000
Subject: RE: [patch] infiniband: calling PTR_ERR() on wrong variable in create_file()
Message-Id: <35AAF1E4A771E142979F27B51793A4888885B23834@AVEXMB1.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120126061529.GC15856@elgon.mountain>
In-Reply-To: <20120126061529.GC15856-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Dept-ENG Infinipath <Dept_Infinipath-h88ZbnxC6KDQT0dZR+AlfA@public.gmane.org>
Cc: Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Subject: [patch] infiniband: calling PTR_ERR() on wrong variable in
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

I double checked the qib driver, and the equivalent code is ok there.

Thanks for the patch!

Acked-by: Mike Marciniszyn <mike.marciniszyn@qlogic.com>

This message and any attached documents contain information from QLogic Corporation or its wholly-owned subsidiaries that may be confidential. If you are not the intended recipient, you may not read, copy, distribute, or use this information. If you have received this transmission in error, please notify the sender immediately by reply e-mail and then delete this message.

