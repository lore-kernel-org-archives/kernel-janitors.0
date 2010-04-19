From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 19 Apr 2010 14:11:28 +0000
Subject: Re: [PATCH] Fix inappropriate substraction on
Message-Id: <1271686289.19685.31805.camel@gandalf.stny.rr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <m2i5a774f4c1004102223zbfc0ce63u4e8682b69e7d8088@mail.gmail.com>
In-Reply-To: <m2i5a774f4c1004102223zbfc0ce63u4e8682b69e7d8088@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shenghui <crosslonelyover@gmail.com>
Cc: fweisbec@gmail.com, mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2010-04-11 at 13:23 +0800, shenghui wrote:
> I noticed inappropriate substraction on variable
> tracing_pages_allocated in trace_free_page()in 2.6.27.y series (from
> 2.6.27 to 2.6.27.46) kernel.
> 

I'm not maintaining a 2.6.27 kernel, but if someone else is, then feel
free to include this.

-- Steve


