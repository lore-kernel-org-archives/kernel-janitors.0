From: "Ted Ts'o" <tytso@mit.edu>
Date: Wed, 11 Aug 2010 03:07:20 +0000
Subject: Re: [PATCH] jbd2: fix warning if CONFIG_JBD2_DEBUG is not used
Message-Id: <20100811030720.GO3635@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281490742.4423.10.camel@lovely.krouter>
In-Reply-To: <1281490742.4423.10.camel@lovely.krouter>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, dingdinghua <dingdinghua@nrchpc.ac.cn>, Joel Becker <joel.becker@oracle.com>, Mark Fasheh <mfasheh@suse.com>, linux-ext4@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>

On Wed, Aug 11, 2010 at 03:39:02AM +0200, Christoph Fritz wrote:
> Commit 8dd420466c7bfc459fa04680bd5690bfc41a4553 makes variable ts unused
> when CONFIG_JBD2_DEBUG is not used. This patch ifdefs it too.
> 
> fs/jbd2/transaction.c: In function ‘start_this_handle’:
> fs/jbd2/transaction.c:98: warning: unused variable ‘ts’
> 
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>

I have a patch queued up to fix this already, using an approach
suggested by Linus.

						- Ted
