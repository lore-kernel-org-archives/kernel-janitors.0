From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 20 Apr 2012 13:51:21 +0000
Subject: Re: [patch] tracing: Remove an unneeded check
Message-Id: <1334929881.28106.77.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420063145.GA22649@elgon.mountain>
In-Reply-To: <20120420063145.GA22649@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2012-04-20 at 09:31 +0300, Dan Carpenter wrote:
> memcpy() returns a pointer to "bug".  Hopefully, it's not NULL here or
> we would already have Oopsed.

You're right that the ret is useless, and the real bug was already fixed
(the possibility that buf could be an invalid pointer).

Not only is this needed, but also get rid of the ret < 0 check in
tracing_splice_read_pipe().

-- Steve


