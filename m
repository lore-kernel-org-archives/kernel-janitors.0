From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2017 09:28:19 +0000
Subject: Re: [PATCH 2/2] pinctrl: sprd: fix off by one bugs
Message-Id: <CACRpkdY61cYzLJyZpwcN1sp_gby=szYRA4ZuCCWvRgitrDxORg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170907072926.56oqezwk4r72yjgt@mwanda> <20170907073211.zgcgmdfrphtqy3d7@mwanda>
In-Reply-To: <20170907073211.zgcgmdfrphtqy3d7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Baolin Wang <baolin.wang@spreadtrum.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Sep 7, 2017 at 1:12 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> info->groups[] has info->ngroups elements so these comparisons should be
>>= instead of >.
>
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Baolin's review tag.

Yours,
Linus Walleij
