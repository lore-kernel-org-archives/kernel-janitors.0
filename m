From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Mar 2016 08:42:46 +0000
Subject: Re: tracing: Make tracer_flags use the right set_flag callback
Message-Id: <20160314084246.GF5273@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160310194403.GA17979@mwanda>
In-Reply-To: <20160310194403.GA17979@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 11, 2016 at 06:50:07AM -0500, Chunyu Hu wrote:
> Thanks so much for catching this. I missed this check. I was just
> thinking that this fail was nearly impossible, and during my tests
> I didn't hit any warn, so i missed this. You taught me a lesson. 
> BTW, How did you hit the warn? a special gcc version / feature?

This is a Smatch thing.

https://blogs.oracle.com/linuxkernel/entry/smatch_static_analysis_tool_overview

regards,
dan carpenter

