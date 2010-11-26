From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 26 Nov 2010 15:37:30 +0000
Subject: Re: [PATCH] mtd: mtdchar: fix information leak to userland
Message-Id: <1290785850.2552.18.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289054485-18190-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1289054485-18190-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org

On Sat, 2010-11-06 at 17:41 +0300, Vasiliy Kulikov wrote:
> Structure mtd_info_user is copied to userland with padding byted
> between "type" and "flags" fields uninitialized.  It leads to leaking
> of contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

