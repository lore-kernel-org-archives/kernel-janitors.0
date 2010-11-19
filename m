From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 19 Nov 2010 13:20:23 +0000
Subject: Re: [patch] UBI: release locks in check_corruption()
Message-Id: <1290172823.4768.1.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101118035804.GM31724@bicker>
In-Reply-To: <20101118035804.GM31724@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

On Thu, 2010-11-18 at 06:58 +0300, Dan Carpenter wrote:
> Commit 45aafd32996e27 "UBI: tighten the corrupted PEB criteria"
> introduced some return paths that didn't release the ubi->buf_mutex;
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c

Thank you, pushed to ubi-2.6.git tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

