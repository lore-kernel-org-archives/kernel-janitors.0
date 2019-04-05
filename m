From: Al Viro <viro@zeniv.linux.org.uk>
Date: Fri, 05 Apr 2019 00:14:45 +0000
Subject: Re: [PATCH] aio: use kmem_cache_free() instead of kfree()
Message-Id: <20190405001444.GH2217@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404084405.47992-1-weiyongjun1@huawei.com>
In-Reply-To: <20190404084405.47992-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 04, 2019 at 08:44:05AM +0000, Wei Yongjun wrote:
> memory allocated by kmem_cache_alloc() should be freed using
> kmem_cache_free(), not kfree().
> 
> Fixes: fa0ca2aee3be ("deal with get_reqs_available() in aio_get_req() itself")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied
