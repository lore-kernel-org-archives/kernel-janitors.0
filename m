From: Andreas Dilger <adilger.kernel@dilger.ca>
Date: Wed, 15 Dec 2010 20:30:56 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <0BAF9CFC-72BF-49A1-93D3-BF60B892389B@dilger.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca> <20101114092533.GB5323@albatros> <20101114180643.593d19ac.akpm@linux-foundation.org> <1289848341.2607.125.camel@edumazet-laptop> <20101123140111.GA3816@hack> <4CEBD37E.5060107@bfs.de> <203E1F2A-2D04-4B7F-8D1B-9DC24522CB5E@dilger.ca> <4CECECA2.6070301@draigBrady.com> <20101124110535.GD5139@cr0.nay.redhat.com> <4CECFB19.1090003@draigBrady.com> <20101215094953.GG19804@ZenIV.linux.org.uk>
In-Reply-To: <20101215094953.GG19804@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: P??draig Brady <P@draigBrady.com>, Am??rico Wang <xiyou.wangcong@gmail.com>, wharms@bfs.de, Eric Dumazet <eric.dumazet@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Vasiliy Kulikov <segoon@openwall.com>, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

On 2010-12-15, at 02:49, Al Viro wrote:
> Incorrect.  See 6.2.6.1 in C99; basically, padding bytes have unspecified
> contents.  Implementation is allowed to leave them in any state
> (including not bothering to copy them when doing struct assignments,
> etc.).  See Appendix J (portability issues) as well.
> 
> The bottom line: if you rely on that, you are relying on non-portable
> details of compiler behaviour.  Moreover, the authors are not even
> required to document what they are doing or to keep that behaviour
> consistent.

I thought my proposed solution was reasonable - add explicit padding fields where there are holes in the structure, which would be unused by the kernel, but since they are defined fields the compiler is obligated to initialize them.

This wouldn't add any overhead in cases where the compiler is already initializing the fields, and is still going to be less overhead than doing a memset(0) on the whole structure, and then initializing the other fields explicitly.

That has the added bonus that it becomes instantly clear where there are padding fields in the structure, and possibly they can be put to use in the future.

Cheers, Andreas





