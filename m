From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 20 Jul 2014 20:19:24 +0000
Subject: Re: [PATCH] staging: input: sunkbd.c: Fix coding style
Message-Id: <20140720201924.GA18347@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140720120103.GA5294@kalio-PC>
 <1405871574.5135.24.camel@joe-AO725>
In-Reply-To: <1405871574.5135.24.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Bivolaru Catalin <bivolaru.catalin@gmail.com>, kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, paul.gortmaker@windriver.com

On Sun, Jul 20, 2014 at 08:52:54AM -0700, Joe Perches wrote:
> On Sun, 2014-07-20 at 15:01 +0300, Bivolaru Catalin wrote:
> > Fix coding style with regard to missing spaces after , and the column limit
> > that was violated after the first change.
> 
> Some checkpatch errors should be ignored.
> 
> These are some of them.
> 
> This change doesn't make it easier to read
> or to find any array entry.
> 
> It's currently in groups of 16 (0x10).
> 
> This change would make it very difficult
> to find any particular entry.
> 
> It might make some sense to change the last
> line to add a trailing "  0,  0" entry as
> the compiler does to make it a bit clearer
> the table has 128 entries.

I'd rather not change a thing in this table - it has been working as is
for many years.

Thanks.

-- 
Dmitry
