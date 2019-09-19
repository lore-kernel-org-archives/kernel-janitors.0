From: Chao Yu <yuchao0@huawei.com>
Date: Thu, 19 Sep 2019 00:54:21 +0000
Subject: Re: [PATCH -next] erofs: fix return value check in erofs_read_superblock()
Message-Id: <9c607274-7897-14c6-5211-a992ea25a992@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190918083033.47780-1-weiyongjun1@huawei.com>
In-Reply-To: <20190918083033.47780-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Gao Xiang <xiang@kernel.org>, Chao
 Yu <chao@kernel.org>, Gao Xiang <gaoxiang25@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org

On 2019/9/18 16:30, Wei Yongjun wrote:
> In case of error, the function read_mapping_page() returns
> ERR_PTR() not NULL. The NULL test in the return value check
> should be replaced with IS_ERR().
> 
> Fixes: fe7c2423570d ("erofs: use read_mapping_page instead of sb_bread")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
