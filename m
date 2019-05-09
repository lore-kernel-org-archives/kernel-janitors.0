From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 May 2019 14:46:50 +0000
Subject: Re: [PATCH] EDAC, sb_edac: remove redundant update of tad_base
Message-Id: <20190509144650.GG21059@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508224201.27120-1-colin.king@canonical.com>
 <20190509141313.GA17053@zn.tnic>
 <55f8efee-a02c-1574-42fa-35e1d3df14f7@canonical.com>
 <20190509144113.GB17053@zn.tnic>
In-Reply-To: <20190509144113.GB17053@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Colin Ian King <colin.king@canonical.com>, Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 09, 2019 at 04:41:13PM +0200, Borislav Petkov wrote:
> Bottom line of what I'm trying to say is, those tags better be useful to
> the general kernel audience - that means, they should be documented so
> that people can look them up - or better not be in commit messages at
> all.

Other people will complain if you don't mention the tool name...

You can't win.  :(

regards,
dan carpenter
