From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 01 Oct 2018 09:26:50 +0000
Subject: Re: [PATCH -next] ovl: make symbol 'ovl_aops' static
Message-Id: <CAJfpegtgQhu4Vdz81onOZ32XE_zgUwHvy73eeQ+bRV-5vJhdnQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537887462-35160-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537887462-35160-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Amir Goldstein <amir73il@gmail.com>, overlayfs <linux-unionfs@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2018 at 4:57 PM, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Fixes the following sparse warning:
>
> fs/overlayfs/inode.c:507:39: warning:
>  symbol 'ovl_aops' was not declared. Should it be static?
>
> Fixes: 5b910bd615ba ("ovl: fix GPF in swapfile_activate of file from overlayfs over xfs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.

Thanks,
Miklos
