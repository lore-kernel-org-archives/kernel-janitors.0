From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Sep 2017 09:52:02 +0000
Subject: DR Checker and KINT static checkers
Message-Id: <20170913095202.a6zsi3xeryzhmxrl@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

LWN.net recently had an article about Dr Checker.  It's a promising new
static analysis tool.  The LWN article is for subscribers only until
tomorrow, but anyone can read the PDF or install the code.  It would be
really interesting if someone could run Dr Checker on a mainline kernel
tree and post the results.
https://lwn.net/Articles/733056/
https://www.usenix.org/system/files/conference/usenixsecurity17/sec17-machiry.pdf
https://github.com/ucsb-seclab/dr_checker/

The other tool that's quite interesting is KINT which looks for integer
overflows.  It's a bit of a pain because you have to annotate some
kernel functions to make it work.  The PDF and source code are here:

http://css.csail.mit.edu/kint/

regards,
dan carpenter

