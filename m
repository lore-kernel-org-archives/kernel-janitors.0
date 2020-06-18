From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 18 Jun 2020 15:07:41 +0000
Subject: Re: [help][coccinelle] coccicheck failed
Message-Id: <a28e6bff-c108-bcaa-78f7-3b525c73e81b@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
In-Reply-To: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/18/20 6:23 AM, Giacomo Picchiarelli wrote:
> Newbie here. I couldn't try the patch attached. 
> I'm using coccinelle (spatch version 1.0.4 with Python support and with PCRE support), 
> I'm having issues with the following command:
> 
> make coccicheck MODE=patch
> 
> "./tools/testing/selftests/net/hwtstamp_config.c:74:45-46: WARNING: Use ARRAY_SIZE
> 
> 807 811
> 
> coccicheck failed"
> 
> Applied to: commit 1b5044021070efa3259f3e9548dc35d1eb6aa844 (HEAD -> master, origin/master, origin/HEAD)
> Merge: 69119673bd50 dbed452a078d
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Wed Jun 17 11:29:37 2020 -0700
> 
> Suggestions?


Add "DEBUG_FILE=cocci.err" to the command line. "cocci.err" will contain
more detailed info about the failure, then someone might know what to do
about it.

-- 
~Randy
