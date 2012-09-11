From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Sep 2012 10:51:27 +0000
Subject: Re: smatch warnings in current upstream kernel
Message-Id: <20120911105127.GD19410@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 11, 2012 at 06:10:02PM +0800, Fengguang Wu wrote:
> Here are the 7161 smatch warnings for 2139 files in upstream head
> 1a95620f45155ac523cd1419d89150fbb4eb858b.  It's not a complete build
> (no make clean), so does not include all possible warnings.
> 

There are some sparse warnings mixed in as well.  They would have
been sent to stderr and smatch warnings get sent to stdout.

But if you want you could look at smatch_scripts/test_kernel.sh
which allows for a parallel build and saves all the warnings in
warns.txt.

I guess you have your own parallel build technique as well and that
works too.

regards,
dan carpenter
