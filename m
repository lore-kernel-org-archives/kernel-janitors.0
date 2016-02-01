From: Greg KH <greg@kroah.com>
Date: Mon, 01 Feb 2016 20:42:53 +0000
Subject: Re: [PATCH] [dm]fix NULL pointer in dm_exception_store_create() when create dm device
Message-Id: <20160201204253.GD18440@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1454310358-755-1-git-send-email-dingxiang@huawei.com>
In-Reply-To: <1454310358-755-1-git-send-email-dingxiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DingXiang <dingxiang@huawei.com>
Cc: snitzer@redhat.com, stable@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 01, 2016 at 03:05:58PM +0800, DingXiang wrote:
> In some conditions(such as umount fs failed),origin path or origin bdev or both of the two is same
> as cow's.If this happens, origin dev will be freed when get cow dev in function "dm_get_device" ,
> then "s->origin->dev" which used by "dm_exception_store_create" will be a NULL pointer.
> 
> Signed-off-by:Ding Xiang <dingxiang@huawei.com>
> ---
>  drivers/md/dm-snap.c |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>
