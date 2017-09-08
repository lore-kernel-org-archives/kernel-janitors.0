From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Sep 2017 11:05:07 +0000
Subject: Re: [PATCH] tsacct: Fix a truncation bug in taskstats
Message-Id: <20170908110507.r3zauka4r3bei543@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908104351.wjjw4mfkcvmtq5dx@mwanda>
In-Reply-To: <20170908104351.wjjw4mfkcvmtq5dx@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Ah crap... Please ignore this one.  I forgot about sign extension.  The
code works fine.

regards,
dan carpenter

