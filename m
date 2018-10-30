From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Oct 2018 19:25:31 +0000
Subject: Re: [PATCH] perf/core: clean up inconsisent indentation
Message-Id: <20181030192531.2ormldhqj2qizy33@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181029233211.21475-1-colin.king@canonical.com>
 <20181030144444.GB23310@kernel.org>
In-Reply-To: <20181030144444.GB23310@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Colin King <colin.king@canonical.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 30, 2018 at 11:44:44AM -0300, Arnaldo Carvalho de Melo wrote:
> Em Mon, Oct 29, 2018 at 11:32:11PM +0000, Colin King escreveu:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Replace a bunch of spaces with tab, cleans up indentation
> 
> I think we can live with the spaces as the 'git blame' information is
> more valuable, i.e. who was that touched that line last?
> 

You can use "git blame -w" to ignore white space changes.  I add it
whenever I run blame.

regards,
dan carpenter
