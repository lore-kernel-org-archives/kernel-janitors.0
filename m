From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 15 Jul 2015 03:15:57 +0000
Subject: Re: [PATCH] Staging:dgnc:remove unused code
Message-Id: <20150715031557.GB18787@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1435828777-24181-1-git-send-email-dingxiang@huawei.com>
In-Reply-To: <1435828777-24181-1-git-send-email-dingxiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 02, 2015 at 05:19:37PM +0800, DingXiang wrote:
> Because precompiled directive "#if 1" exist,so the "#else" part
> will never be compiled,so remove it.
> 
> Signed-off-by: DingXiang <dingxiang@huawei.com>
> ---
>  dgnc_neo.c |    9 +--------
>  1 files changed, 1 insertions(+), 8 deletions(-)
> 
> diff --git a/dgnc_neo.c b/dgnc_neo.c
> index 1e583c2..8e85909 100644
> --- a/dgnc_neo.c
> +++ b/dgnc_neo.c

Same problem as the other patch :(
