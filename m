From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 May 2018 06:59:51 +0000
Subject: Re: [PATCH] clk: boston: fix memory leak of 'onecell' on error return paths
Message-Id: <20180510065951.fiojonx5f776z5jm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180509134031.11611-1-colin.king@canonical.com>
 <20180509140135.4dndt3baomtxups5@mwanda>
 <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
In-Reply-To: <20180509163311.alvyibwwuwkumyxf@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Burton <paul.burton@mips.com>
Cc: Colin King <colin.king@canonical.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

It would be nice to make things static check clean.  One idea would be
that the static checker could ignore resource leaks in __init functions.

regards,
dan carpenter

