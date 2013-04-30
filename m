From: Matt Fleming <matt@console-pimps.org>
Date: Tue, 30 Apr 2013 11:34:01 +0000
Subject: Re: [patch] efi: remove "kfree(NULL)"
Message-Id: <517FAC29.9030307@console-pimps.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430074344.GE7237@elgon.mountain>
In-Reply-To: <20130430074344.GE7237-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 30/04/13 08:43, Dan Carpenter wrote:
> No need to free a NULL pointer.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.

-- 
Matt Fleming, Intel Open Source Technology Center
