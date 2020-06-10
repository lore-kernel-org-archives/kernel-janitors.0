From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 10 Jun 2020 09:27:58 +0000
Subject: Re: exfat: Improving exception handling in two functions
Message-Id: <208cba7b-e535-c8e0-5ac7-f15170117a7f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b9272fb-b265-010b-0696-4c0579abd841@web.de>
In-Reply-To: <9b9272fb-b265-010b-0696-4c0579abd841@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-fsdevel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Tetsuhiro Kohada <kohada.t2@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>

Hello,

I have taken another look at pointer usage after calls of the function “brelse”.
My source code analysis approach pointed implementation details
like the following out for further software development considerations.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/exfat/namei.c?id=3d155ae4358baf4831609c2f9cd09396a2b8badf#n1078

…
		epold = exfat_get_dentry(sb, p_dir, oldentry + 1, &old_bh,
			&sector_old);
		epnew = exfat_get_dentry(sb, p_dir, newentry + 1, &new_bh,
			&sector_new);
		if (!epold || !epnew)
			return -EIO;
…

I suggest to split such an error check.
How do you think about to release a buffer head object for the desired
exception handling if one of these function calls succeeded?

Would you like to adjust such code in the functions “exfat_rename_file”
and “exfat_move_file”?

Regards,
Markus
