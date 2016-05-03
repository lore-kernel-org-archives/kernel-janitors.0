From: Matt Fleming <matt@codeblueprint.co.uk>
Date: Tue, 03 May 2016 15:35:20 +0000
Subject: Re: [PATCH] efivarfs: merge boolean flag arguments
Message-Id: <20160503153520.GB2839@codeblueprint.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461245069-10221-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461245069-10221-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vaishali.thakkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, saurabh.truth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

On Thu, 21 Apr, at 03:24:29PM, Julia Lawall wrote:
> The parameters atomic and duplicates of efivar_init always have opposite
> values.  Drop the parameter atomic, replace the uses of !atomic with
> duplicates, and update the call sites accordingly.
> 
> The code using duplicates is slightly reorganized with an else, to avoid
> duplicating the lock code.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> Not tested.  I have assumed that the calls to both variable_is_present and
> dup_variable_bug need to be out of the lock.
> 
>  drivers/firmware/efi/efivars.c |    5 ++---
>  drivers/firmware/efi/vars.c    |   23 ++++++++++-------------
>  fs/efivarfs/super.c            |    3 +--
>  include/linux/efi.h            |    3 +--
>  4 files changed, 14 insertions(+), 20 deletions(-)

Applied. Thanks Julia.
