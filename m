From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 09 Oct 2011 14:11:30 +0000
Subject: Re: [patch] PM / Hibernate: NULL dereferences on error paths
Message-Id: <20111009141130.GP18470@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111007132453.GA31424@elgon.mountain>
In-Reply-To: <20111007132453.GA31424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 09, 2011 at 12:11:23AM +1100, Bojan Smojver wrote:
> With the introduction of threads, there were so many unwind places,
> that I thought I may forget something in some of them, therefore
> causing different bugs. So, I put everything under out_clean, so
> it's all done in one place. Obviously, everything's a trade-off in
> life. :-)

In general if you care about total bugs over the entire project then
simpler code is less buggy.  But I understand that you've eliminated
a bug class and I can respect that.

regards,
dan carpenter
