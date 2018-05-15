From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 15 May 2018 18:28:40 +0000
Subject: Re: [PATCH] clk: boston: fix memory leak of 'onecell' on error return paths
Message-Id: <152640892003.34267.13202118557714072290@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180509134031.11611-1-colin.king@canonical.com>
 <20180509140135.4dndt3baomtxups5@mwanda>
 <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
 <20180510065951.fiojonx5f776z5jm@mwanda>
In-Reply-To: <20180510065951.fiojonx5f776z5jm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Paul Burton <paul.burton@mips.com>
Cc: Colin King <colin.king@canonical.com>, Michael Turquette <mturquette@baylibre.com>, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Dan Carpenter (2018-05-09 23:59:51)
> It would be nice to make things static check clean.  One idea would be
> that the static checker could ignore resource leaks in __init functions.
> 

Typically if the stuff is so important that it doesn't work without it
then we throw in a panic() or a BUG() call to indicate that all hope is
lost. Otherwise, I'm not sure what's wrong with adding in proper error
paths for clean recovery.
