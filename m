From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 04 Sep 2019 15:11:52 +0000
Subject: Re: NFS: remove the redundant check when kfree an object in nfs_netns_client_release
Message-Id: <ee684073-bd3e-9a1c-4d38-702f55affba4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1567490688-17872-1-git-send-email-zhongjiang@huawei.com>
In-Reply-To: <1567490688-17872-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zhong jiang <zhongjiang@huawei.com>, Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> kfree has taken the null check in account.

I suggest to take another look at a similar patch.

NFS: fix ifnullfree.cocci warnings
https://lkml.org/lkml/2019/7/7/73
https://lore.kernel.org/patchwork/patch/1098005/
https://lore.kernel.org/r/alpine.DEB.2.21.1907071844310.2521@hadrien/

Regards,
Markus
