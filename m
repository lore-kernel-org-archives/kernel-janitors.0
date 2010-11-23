From: David Miller <davem@davemloft.net>
Date: Tue, 23 Nov 2010 20:22:03 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <20101123.122203.260090992.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4CEBD37E.5060107@bfs.de>
	<203E1F2A-2D04-4B7F-8D1B-9DC24522CB5E@dilger.ca>
	<20101123121840.e9d17d91.akpm@linux-foundation.org>
In-Reply-To: <20101123121840.e9d17d91.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org
Cc: adilger.kernel@dilger.ca, wharms@bfs.de, xiyou.wangcong@gmail.com, eric.dumazet@gmail.com, segoon@openwall.com, kernel-janitors@vger.kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, jakub@redhat.com

From: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 23 Nov 2010 12:18:40 -0800

> We can't reasonably address this with gcc changes.  If gcc starts doing
> what we want in the next release, how long will it be until that
> release is the *oldest* version of gcc which the kernel may be compiled
> with?  Five years?

Completely agreed.
