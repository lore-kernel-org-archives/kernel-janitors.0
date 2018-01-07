From: Martin Kelly <martin@martingkelly.com>
Date: Sun, 07 Jan 2018 21:43:32 +0000
Subject: Re: [PATCH] tools: fix cross-compile var export
Message-Id: <737bf492-63bc-0f97-9811-b0c90b5f60c6@martingkelly.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180106201601.11074-1-martin@martingkelly.com>
 <20180107161140.GM6273@windriver.com>
 <549cf839-9ae7-78ce-58df-3d84fc7b3d05@martingkelly.com>
 <20180107190453.GN6273@windriver.com>
In-Reply-To: <20180107190453.GN6273@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-embedded@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Matt Mackall <mpm@selenic.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On 01/07/2018 11:04 AM, Paul Gortmaker wrote:
> [Re: [PATCH] tools: fix cross-compile var export] On 07/01/2018 (Sun 10:31) Martin Kelly wrote:
> 
> [...]
> 
>> With the change, we add do CC = $(CROSS_COMPILE)gcc if and only if CC is not
>> already set. I'm happy to add all these details to the commit description.
> 
> That is probably a step in the right direction.  I contribute to yocto
> on a regular basis and hence am sympathetic to these frustrating SDK
> type issues.  But after a quick scan of this patch it wasn't obvious to
> me that existing behaviour was preserved, or that it would be a pain to
> separate it into chunks. (key word here being "quick")
> 
> So I'd recommend updating the commit log, and adding a Cc: line for the
> maintainers of each subsystem below, and then if nobody complains you
> might get akpm to pick it up as he does for other patches w/o a clear
> maintainer or subsystem.
> 
> P

Thanks, I have done so. I also contribute to Yocto and indeed, SDK 
issues are all-to-common.
