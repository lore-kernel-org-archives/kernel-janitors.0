From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:19:50 +0000
Subject: [patch 4/4] mwifiex: return -ENOMEM if kzalloc() fails
Message-Id: <20111018061950.GJ27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Sorry, I've decided to hold this one back.  It was written in a lazy
way and only fixed the return codes that Smatch complained about.
I'll redo it and send it later.

regards,
dan carpenter
