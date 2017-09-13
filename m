From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Sep 2017 10:21:23 +0000
Subject: Re: DR Checker and KINT static checkers
Message-Id: <20170913102123.nsg7dpolysn6fk5u@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170913095202.a6zsi3xeryzhmxrl@mwanda>
In-Reply-To: <20170913095202.a6zsi3xeryzhmxrl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 13, 2017 at 12:01:33PM +0200, Julia Lawall wrote:
> 
> On Wed, 13 Sep 2017, Dan Carpenter wrote:
> 
> > LWN.net recently had an article about Dr Checker.  It's a promising new
> > static analysis tool.  The LWN article is for subscribers only until
> > tomorrow, but anyone can read the PDF or install the code.  It would be
> > really interesting if someone could run Dr Checker on a mainline kernel
> > tree and post the results.
> > https://lwn.net/Articles/733056/
> > https://www.usenix.org/system/files/conference/usenixsecurity17/sec17-machiry.pdf
> > https://github.com/ucsb-seclab/dr_checker/
> 
> I'm always puzzled by statements like:
> 
> Some 5,000 warnings were generated, of which nearly 4,000 were verified as
> correct by the team. Of those, 158 were actual bugs that were reported
> upstream and fixed.

My read was that the 4000 warnings were code bugs that don't affect
runtime, such as inconsistent NULL checking but the pointer isn't
NULL so it doesn't affect runtime?  That's a pure guess.

> 
> If they took the time to validate 5000 bugs, couldn't they have sent more
> patches, or at least made the results public in some way so that other
> people could fix them?  Maybe the others are "duplicated, but correct"...

I think people are worried about posting the results so they don't get
blamed for disclosing a kernel vulnerability.  I used to worry about
that but now I assume everything a static checker can find is public
information already.

regards,
dan carpenter

