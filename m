From: Borislav Petkov <bp@alien8.de>
Date: Thu, 09 May 2019 14:13:13 +0000
Subject: Re: [PATCH] EDAC, sb_edac: remove redundant update of tad_base
Message-Id: <20190509141313.GA17053@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508224201.27120-1-colin.king@canonical.com>
In-Reply-To: <20190508224201.27120-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 08, 2019 at 11:42:01PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable tad_base is being set to a value that is never read
> and is being over-written on the next iteration of a for-loop.
> This assignment is therefore redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")

What's that tag's function supposed to be?

I see a lot of those in commit messages but it is nowhere documented in
the tree.

$ git grep -i coverity

doesn't give anything relevant.

Hmm?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
