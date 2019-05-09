From: Borislav Petkov <bp@alien8.de>
Date: Thu, 09 May 2019 14:41:13 +0000
Subject: Re: [PATCH] EDAC, sb_edac: remove redundant update of tad_base
Message-Id: <20190509144113.GB17053@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508224201.27120-1-colin.king@canonical.com>
 <20190509141313.GA17053@zn.tnic>
 <55f8efee-a02c-1574-42fa-35e1d3df14f7@canonical.com>
In-Reply-To: <55f8efee-a02c-1574-42fa-35e1d3df14f7@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 09, 2019 at 03:29:42PM +0100, Colin Ian King wrote:
> These are the Coverity static analysis warning/error message
> classifications.  Tagging them should be useful for several reasons:
> 
> 1. We can classify the types of issues being fixed
> 2. We can see how many issues are being found/fixed with the use of
> static analysis tools like Coverity

Who's "We"?

> 3. It provides some context on how these bugs were being found.

I figured as much but I have more questions:

* you say "tools like Coverity" but the name Coverity is in the tag.
So another tool would want to add its own tag. Which begs the second
question:

* has it ever been discussed and/or agreed upon all those "tools" tags?

Because we remove internal tags which have no bearing on the upstream
kernel. When I see that tag, how can I find out what it means? Can I run
coverity myself?

Lemme dig another one:

Addresses-Coverity-ID: 744899 ("Missing break in switch")

Where do I look up that ID?

And so on...

Bottom line of what I'm trying to say is, those tags better be useful to
the general kernel audience - that means, they should be documented so
that people can look them up - or better not be in commit messages at
all.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
