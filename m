From: Borislav Petkov <bp@alien8.de>
Date: Tue, 27 Nov 2018 12:49:15 +0000
Subject: Re: [PATCH] EDAC, skx: clean up a debug printk
Message-Id: <20181127124915.GD26395@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181127113235.7mxd7cxojtzbkbid@kili.mountain>
In-Reply-To: <20181127113235.7mxd7cxojtzbkbid@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 27, 2018 at 02:32:35PM +0300, Dan Carpenter wrote:
> I've removed the 0x prefix for the row and col because the %#x format
> already adds a 0x.

Pls use passive tone in your commit message: no "we" or "I", etc.

Also, pls read section "2) Describe your changes" in
Documentation/process/submitting-patches.rst.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
