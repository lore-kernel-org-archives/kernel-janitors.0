From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sun, 22 Feb 2009 12:45:43 +0000
Subject: Re: [PATCH] init/main.c: fix sparse warnings: context imbalance
Message-Id: <49A148F7.1010302@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221194940.12602.54077.stgit@vmbox.hanneseder.net>	 <49A13765.5070902@s5r6.in-berlin.de> <154e089b0902220336m2aeebc56p6f2af57118463352@mail.gmail.com> <49A1477B.7080206@s5r6.in-berlin.de>
In-Reply-To: <49A1477B.7080206@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Ingo Molnar <mingo@elte.hu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Stefan Richter wrote:
> Hannes Eder wrote:
>> On Sun, Feb 22, 2009 at 12:30 PM, Stefan Richter
>> <stefanr@s5r6.in-berlin.de> wrote:
>>> It is not a fix, it's merely an annotation.
>> This patch 'better word for fix's a warning reported by sparse. What
>> better wording would you suggest?
> 
> "annotate init_post() as releasing the BKL" or whatever in the title,
> furthermore "Removes the following sparse warnings: ..." in the changelog.

PS:  In some sense it is indeed a "fix" for the high-level problem that
sparse can't guess whether the context imbalance is correct or not.  The
original warning from sparse was correct in itself.  Your annotation
enables sparse to warn if problems outside the scope of the single
function occur (I guess).  So it's more a maintainabiliy improvement
than a fix.
-- 
Stefan Richter
-===-=--= --=- =-=-
http://arcgraph.de/sr/
