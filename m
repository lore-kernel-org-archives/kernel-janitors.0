From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 May 2017 08:58:55 +0000
Subject: Re: [RFC] Spurious error handling code in 'vc4_get_hang_state_ioctl'
Message-Id: <20170509085855.32lq7zqjtroubchp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bba7889b-7f80-c973-0a1b-e56a4a88cb03@wanadoo.fr>
In-Reply-To: <bba7889b-7f80-c973-0a1b-e56a4a88cb03@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 08, 2017 at 05:29:00PM +0200, Christophe JAILLET wrote:
> Hi,
> 
> While looking for labels with a spurious order in the linux kernel code, I
> came across code around:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/vc4/vc4_gem.c#n106
> 
> The error handling in this for loop looks spurious to me:
>    - if 'drm_gem_handle_create' fails, we leak 'bo_state'
>      This is freed after the 'copy_to_user'
>    - if 'drm_gem_handle_create' fails, then we have 'state->bo_count = i - 1'
>      This looks odd. 'state->bo_count = i' sounds more logical to me.

This is correct.

>    - as 'state->bo_count' is updated, this could mean than the
> 'copy_to_user' should be performed.

This also seems correct, but I doubt user space is actually set up to
handle errors in real life...  It could be that I'm too pesimistic.

regards,
dan carpenter

