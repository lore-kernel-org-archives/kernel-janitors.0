From: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 26 Nov 2014 14:27:06 +0000
Subject: Re: [patch] tracing: off by one in __trace_array_vprintk()
Message-Id: <20141126092706.5d4038d4@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141126140621.GA18740@mwanda>
In-Reply-To: <20141126140621.GA18740@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 26 Nov 2014 17:06:21 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This check says "goto out;" if we had to truncate the string.
> 
> The "tbuffer" buffer has TRACE_BUF_SIZE bytes.  The vsnprintf() function
> returns the number of characters (not counting the NUL char) which would
> have been printed if there were space.  If we we tried to print
> TRACE_BUF_SIZE characters, the last character would have been truncated
> to make space for the NUL character so we should "goto out;".
> 

Oh, and the NUL character is never copied. We copy the string into the
buffer with:

	memcpy(&entry->buf, tbuffer, len);

Where len does not include NUL, and why we add it ourselves.

-- Steve
