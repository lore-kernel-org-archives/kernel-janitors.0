From: David Miller <davem@davemloft.net>
Date: Tue, 03 Jun 2014 00:02:58 +0000
Subject: Re: [PATCH 10/11] vxge: Remove useless return variables
Message-Id: <20140602.170258.144328105696750793.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401542051-3174-10-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1401542051-3174-10-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.senna@gmail.com
Cc: jdmason@kudzu.us, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 31 May 2014 10:14:10 -0300

> This patch remove variables that are initialized with a constant,
> are never updated, and are only used as parameter of return.
> Return the constant instead of using a variable.
> 
> Verified by compilation only.
...
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

Applied.
