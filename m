From: Bart Van Assche <Bart.VanAssche@wdc.com>
Date: Fri, 03 Aug 2018 19:56:40 +0000
Subject: Re: [PATCH] RDMA: Fix an uninitialized variable
Message-Id: <43163d6fac02f3dce7fcea0d816b019aaf03f0b7.camel@wdc.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803192431.pmisuz3qwefd45se@kili.mountain>
In-Reply-To: <20180803192431.pmisuz3qwefd45se@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 2018-08-03 at 13:43 -0600, Jason Gunthorpe wrote:
+AD4- On Fri, Aug 03, 2018 at 10:24:31PM +-0300, Dan Carpenter wrote:
+AD4- +AD4- A couple of the callers assume that ib+AF8-post+AF8-send() initializes
+AD4- +AD4- +ACo-bad+AF8-send+AF8-wr.  It doesn't look like we can rely on the -+AD4-post+AF8-send()
+AD4- +AD4- function to initialize it.  For example in the i40iw+AF8-post+AF8-recv()
+AD4- +AD4- function and there are some error paths there which don't set it.
+AD4- 
+AD4- I think those are bugs in the drivers, if bad+AF8-wr is provided, and
+AD4- post+AF8-send fails then it must be set to the wr that has a problem, left
+AD4- unset/uninit is incorrect.
+AD4- 
+AD4- This is a high performance call path, so I'd prefer not to see
+AD4- unnecessary babying of drivers..
+AD4- 
+AD4- Bart?

Hello Dan and Jason,

The documentation of the bad+AF8-wr parameter for ib+AF8-post+AF8-send(), ib+AF8-post+AF8-recv()
and ib+AF8-post+AF8-srq+AF8-recv() is as follows:

 +ACo- +AEA-bad+AF8-...wr: On an immediate failure, this parameter will reference
 +ACo-   the work request that failed to be posted on the QP.

In other words, nothing is guaranteed about the +ACo-bad+AF8-wr value if these
functions return 0. My proposal is to proceed as follows:
+ACo- In the ULPs that read +ACo-bad+AF8-wr if one of these functions returns 0, initialize
  +ACo-bad+AF8-wr before calling one of these functions (I think all ULPs already do this).
+ACo- Make sure that all HW drivers set +ACo-bad+AF8-wr if the return value is not 0.

Thanks,

Bart.

