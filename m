From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 07 Oct 2011 13:38:51 +0000
Subject: Re: [patch] trace: cleanup: make some types unsigned
Message-Id: <1317994732.4729.39.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132744.GC31424@elgon.mountain>
In-Reply-To: <20111007132744.GC31424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2011-10-07 at 16:27 +0300, Dan Carpenter wrote:
> The problem here is that I'm trying to silence a static checker
> warning.  In replace_preds() we cap n_preds at MAX_FILTER_PRED but
> we don't check for negative values.  It can't actually be negative
> values, but the static checkers get confused.

I really hate to uglify code for the sake of static checkers.

This code may change in the near future, and the possibility that
n_preds may become a possibility. Perhaps we should add a:

WARN_ON(n_preds < 0);

If in the future the count_preds() changes and incorrectly produces a
negative number, or perhaps even overflows int, we wont catch it with
unsigned.

-- Steve


