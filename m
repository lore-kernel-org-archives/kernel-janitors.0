From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Dec 2016 20:05:45 +0000
Subject: Re: md: Combine two kmalloc() calls into one in sb_equal()
Message-Id: <e25d2f8a-8ee9-c541-dac4-a254502df293@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4df733d-8e06-8ba1-c4c3-800d8c5615ba@users.sourceforge.net>
 <1481310314.5946.40.camel@perches.com>
In-Reply-To: <1481310314.5946.40.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: linux-raid@vger.kernel.org, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> 	tmp1 = kmemdup(sb1, MD_SB_GENERIC_CONSTANT_WORDS * sizeof(__u32), GFP_KERNEL);

Is a function available in the Linux programming interface which would duplicate
the beginning of two array elements in a single call directly?

Regards,
Markus
