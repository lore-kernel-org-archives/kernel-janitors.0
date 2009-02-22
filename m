From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 11:36:53 +0000
Subject: Re: [PATCH] init/main.c: fix sparse warnings: context imbalance
Message-Id: <154e089b0902220336m2aeebc56p6f2af57118463352@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221194940.12602.54077.stgit@vmbox.hanneseder.net>
	 <49A13765.5070902@s5r6.in-berlin.de>
In-Reply-To: <49A13765.5070902@s5r6.in-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Ingo Molnar <mingo@elte.hu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Feb 22, 2009 at 12:30 PM, Stefan Richter
<stefanr@s5r6.in-berlin.de> wrote:
> Hannes Eder wrote:
>> Impact: Attribute function 'init_post' with __releases(...).
>>
>> Fix this sparse warnings:
>
> It is not a fix, it's merely an annotation.

This patch 'better word for fix's a warning reported by sparse. What
better wording would you suggest?

Thanks, -Hannes
