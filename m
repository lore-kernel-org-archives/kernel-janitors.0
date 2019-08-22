From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Aug 2019 08:11:53 +0000
Subject: Re: [PATCH] xfs: Use BUG_ON rather than BUG() to remove unreachable code
Message-Id: <20190822081153.GG4451@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822062320.GA35267@LGEARND20B15>
In-Reply-To: <20190822062320.GA35267@LGEARND20B15>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Austin Kim <austindh.kim@gmail.com>
Cc: darrick.wong@oracle.com, linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Depending on the config BUG() might be a no-op.  Outside of filesystems
everyone ignores that and crashes ungracefully, but in filesystems they
don't want to risk corrupting your files.

regards,
dan carpenter
