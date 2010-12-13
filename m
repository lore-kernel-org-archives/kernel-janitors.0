From: Dan Carpenter <error27@gmail.com>
Date: Mon, 13 Dec 2010 19:46:42 +0000
Subject: Re: [patch] perf: off by one in perf_swevent_init()
Message-Id: <20101213194641.GH1620@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101024195041.GT5985@bicker>
In-Reply-To: <20101024195041.GT5985@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Oct 24, 2010 at 09:50:42PM +0200, Dan Carpenter wrote:
> The perf_swevent_enabled[] array has PERF_COUNT_SW_MAX elements.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Ping.

regards,
dan carpenter

