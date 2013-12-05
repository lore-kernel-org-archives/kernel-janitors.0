From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Dec 2013 12:57:35 +0000
Subject: Re: [patch] mtd: sm_ftl: heap corruption in sm_create_sysfs_attributes()
Message-Id: <20131205125735.GX5443@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131205110235.GA14728@elgon.mountain> <52A06B00.7070309@bfs.de>
In-Reply-To: <52A06B00.7070309@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

Yeah, good point.  kstrndup() is cleaner.  I will resend.

regards,
dan carpenter

