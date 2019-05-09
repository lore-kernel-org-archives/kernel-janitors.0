From: Borislav Petkov <bp@alien8.de>
Date: Thu, 09 May 2019 15:01:46 +0000
Subject: Re: [PATCH] EDAC, sb_edac: remove redundant update of tad_base
Message-Id: <20190509150146.GE17053@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508224201.27120-1-colin.king@canonical.com>
 <20190509141313.GA17053@zn.tnic>
 <55f8efee-a02c-1574-42fa-35e1d3df14f7@canonical.com>
 <20190509144113.GB17053@zn.tnic>
 <ebe15617-fe6a-2668-f14e-146811147f14@canonical.com>
In-Reply-To: <ebe15617-fe6a-2668-f14e-146811147f14@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 09, 2019 at 03:55:32PM +0100, Colin Ian King wrote:
> Yep, I agree, but explaining all the Coverity error types in a kernel
> doc is going to take some effort, which I really don't have much time
> for at the moment.

I'm not suggesting you should document them all or write a comprehensive
howto on how to run Coverity - all I'm suggesting is starting a small
doc somewhere in Documentation/ which contains some info on what all
those tools tags we use, mean and how people can find the information
they contain. Basically what you said above (which I've snipped).

But it would be a lot more helpful if it is written down so that people
can look it up. Also, that doc will serve as a documentation of all
those tags we're using in the kernel and what their format, etc would
be.

Otherwise we'll have the current head scratching when a tag like that is
encountered...

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
