From: Chao Yu <chao@kernel.org>
Date: Mon, 16 Dec 2019 13:28:20 +0000
Subject: Re: [RFC PATCH v5] f2fs: support data compression
Message-Id: <0677a4fd-62a5-ad98-fd02-ae7d5a9cb501@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <0ab8c593-d043-cdf6-7805-f7bceba8e519@web.de>
In-Reply-To: <0ab8c593-d043-cdf6-7805-f7bceba8e519@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2019-12-16 19:51, Markus Elfring wrote:
> …
>> +++ b/fs/f2fs/f2fs.h
> …
>> +#ifdef CONFIG_F2FS_FS_COMPRESSION
>> +bool f2fs_is_compressed_page(struct page *page);
> …
>
> Can the following adjustment make sense?
>
> +bool f2fs_is_compressed_page(const struct page *page);
>
>
> Would you like to improve const-correctness at any more source code places?

I can't figure out a good reason to do that for f2fs internal functions...

Thanks,

>
> Regards,
> Markus
>
