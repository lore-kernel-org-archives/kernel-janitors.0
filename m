From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jun 2019 06:02:50 +0000
Subject: Re: [PATCH] NTB: test: remove a duplicate check
Message-Id: <20190619060250.GH18776@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619053205.GA10452@mwanda>
 <2f4dea74-d78e-8b53-8dec-df8dc032759c@deltatee.com>
In-Reply-To: <2f4dea74-d78e-8b53-8dec-df8dc032759c@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It's not a huge deal obviously but your commit was a6bed7a54165 ("NTB:
Introduce NTB MSI Test Client") but you know that if I had sent a patch
called ("NTB: remove a duplicate check") people would have correctly
complained because the patch prefix is too vague.

What I'm saying is we do this all the time:

[PATCH] NTB: add a new foobazle driver

But it should be:

[PATCH] NTB: foobazle: add a new foobazle driver

Then I can just copy and paste your patch prefix instead of trying
invent one.

regards,
dan carpenter
