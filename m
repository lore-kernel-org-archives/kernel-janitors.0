From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sun, 22 Feb 2009 12:39:23 +0000
Subject: Re: [PATCH] init/main.c: fix sparse warnings: context imbalance
Message-Id: <49A1477B.7080206@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221194940.12602.54077.stgit@vmbox.hanneseder.net>	 <49A13765.5070902@s5r6.in-berlin.de> <154e089b0902220336m2aeebc56p6f2af57118463352@mail.gmail.com>
In-Reply-To: <154e089b0902220336m2aeebc56p6f2af57118463352@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Ingo Molnar <mingo@elte.hu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hannes Eder wrote:
> On Sun, Feb 22, 2009 at 12:30 PM, Stefan Richter
> <stefanr@s5r6.in-berlin.de> wrote:
>> It is not a fix, it's merely an annotation.
> 
> This patch 'better word for fix's a warning reported by sparse. What
> better wording would you suggest?

"annotate init_post() as releasing the BKL" or whatever in the title,
furthermore "Removes the following sparse warnings: ..." in the changelog.
-- 
Stefan Richter
-===-=--= --=- =-=-
http://arcgraph.de/sr/
