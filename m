From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Feb 2016 09:46:54 +0000
Subject: Re: [PATCH] checkpatch.pl: fix naked sscanf false positives
Message-Id: <20160205094654.GC32153@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160205082952.GA18361@kwern-VirtualBox>
In-Reply-To: <20160205082952.GA18361@kwern-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 05, 2016 at 12:29:52AM -0800, Kevin Wern wrote:
> There is a section of checkpatch.pl that intends to ensure the return
> value of sscanf is always checked.  However, in certain cases, like in
> drivers/staging/dgnc/dgnc.mod.c

You shouldn't be running checkpatch.pl on a mod.c file.  Those are just
a build artifact and not code.

regards,
dan carpenter

