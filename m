From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 16 Dec 2019 13:38:50 +0000
Subject: Re: [v5] f2fs: support data compression
Message-Id: <b1a2b133-ab92-eb14-ccfe-5d584ed8bb0c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <0ab8c593-d043-cdf6-7805-f7bceba8e519@web.de>
 <0677a4fd-62a5-ad98-fd02-ae7d5a9cb501@kernel.org>
In-Reply-To: <0677a4fd-62a5-ad98-fd02-ae7d5a9cb501@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>> +bool f2fs_is_compressed_page(const struct page *page);
>>
>>
>> Would you like to improve const-correctness at any more source code places?
>
> I can't figure out a good reason to do that for f2fs internal functions...

Do you insist to keep such a function parameter mutable?

Regards,
Markus
