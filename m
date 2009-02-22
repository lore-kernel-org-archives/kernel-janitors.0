From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sun, 22 Feb 2009 11:30:45 +0000
Subject: Re: [PATCH] init/main.c: fix sparse warnings: context imbalance
Message-Id: <49A13765.5070902@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221194940.12602.54077.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221194940.12602.54077.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Ingo Molnar <mingo@elte.hu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hannes Eder wrote:
> Impact: Attribute function 'init_post' with __releases(...).
> 
> Fix this sparse warnings:

It is not a fix, it's merely an annotation.
-- 
Stefan Richter
-===-=--= --=- =-=-
http://arcgraph.de/sr/
