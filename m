From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Apr 2018 10:27:17 +0000
Subject: Re: [PATCH v2] mfd: tps65911-comparator: Fix an off by one bug
Message-Id: <20180423102717.tmx7mlk2yzovnpkh@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180420083909.66a6t63s5q6vpwp7@dell>
 <20180420090910.GA26071@mwanda>
 <20180423064417.2e2ng3su23w4i7hx@dell>
In-Reply-To: <20180423064417.2e2ng3su23w4i7hx@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I really don't want authorship credit for a patch that does:

#define COMP1 0
#define COMP2 1

It just makes me itch to look at it...

regards,
dan carpenter


