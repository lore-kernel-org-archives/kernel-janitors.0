From: zhong jiang <zhongjiang@huawei.com>
Date: Thu, 05 Sep 2019 02:40:55 +0000
Subject: Re: NFS: remove the redundant check when kfree an object in nfs_netns_client_release
Message-Id: <5D7075B7.3080400@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1567490688-17872-1-git-send-email-zhongjiang@huawei.com> <ee684073-bd3e-9a1c-4d38-702f55affba4@web.de>
In-Reply-To: <ee684073-bd3e-9a1c-4d38-702f55affba4@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2019/9/4 23:11, Markus Elfring wrote:
>> kfree has taken the null check in account.
> I suggest to take another look at a similar patch.
How to fast find out the similar patch. Search the key word doesn't work well.

Thanks,
zhong jiang
> NFS: fix ifnullfree.cocci warnings
> https://lkml.org/lkml/2019/7/7/73
> https://lore.kernel.org/patchwork/patch/1098005/
> https://lore.kernel.org/r/alpine.DEB.2.21.1907071844310.2521@hadrien/
>
> Regards,
> Markus
>
> .
>
