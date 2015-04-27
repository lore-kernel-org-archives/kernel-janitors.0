From: Matt Fleming <matt@codeblueprint.co.uk>
Date: Mon, 27 Apr 2015 16:31:25 +0000
Subject: Re: [patch] efi: efivar_create_sysfs_entry() should return negative error codes
Message-Id: <20150427163125.GD5042@codeblueprint.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150421092153.GA12098@mwanda>
In-Reply-To: <20150421092153.GA12098@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Matt Fleming <matt.fleming-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, 21 Apr, at 12:21:53PM, Dan Carpenter wrote:
> It's not very normal to return 1 on failure and 0 on success.  There
> isn't a reason for it here, the callers don't care so long as it's
> non-zero on failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.

-- 
Matt Fleming, Intel Open Source Technology Center
