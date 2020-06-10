From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 10 Jun 2020 12:07:39 +0000
Subject: Re: [PATCH] exfat: call brelse() on error path
Message-Id: <6939014a-adbf-f970-2541-df16d35de7e5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610095934.GA35167@mwanda>
In-Reply-To: <20200610095934.GA35167@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>

> If the second exfat_get_dentry() call fails then we need to release
> "old_bh" before returning.

Thanks you picked a bit of information up from my source code analysis
for a possible adjustment of the function “exfat_rename_file”.

exfat: Improving exception handling in two functions
https://lore.kernel.org/linux-fsdevel/208cba7b-e535-c8e0-5ac7-f15170117a7f@web.de/
https://lkml.org/lkml/2020/6/10/272

Would you like to adjust the implementation of the function “exfat_move_file”
in a similar way in a subsequent patch variant?

Regards,
Markus
