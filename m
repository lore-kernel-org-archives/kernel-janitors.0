From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2018 13:24:30 +0000
Subject: Re: [PATCH] EDAC, skx: clean up a debug printk
Message-Id: <20181127131316.GA3073@unbuntlaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181127113235.7mxd7cxojtzbkbid@kili.mountain>
In-Reply-To: <20181127113235.7mxd7cxojtzbkbid@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 27, 2018 at 01:49:15PM +0100, Borislav Petkov wrote:
> On Tue, Nov 27, 2018 at 02:32:35PM +0300, Dan Carpenter wrote:
> > I've removed the 0x prefix for the row and col because the %#x format
> > already adds a 0x.
> 
> Pls use passive tone in your commit message: no "we" or "I", etc.
> 
> Also, pls read section "2) Describe your changes" in
> Documentation/process/submitting-patches.rst.
>

I don't agree with all the style nit-picking these days.  I think a
competent programmer can understand the commit message so it's fine.
I'm not going to resend, sorry.

Just give me the Reported-by tag and re-write it how you want.

regards,
dan carpenter
