From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 May 2020 13:39:05 +0000
Subject: Re: [PATCH] xfs: fix error code in xfs_iflush_cluster()
Message-Id: <20200513133905.GB3041@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513094803.GF347693@mwanda>
 <20200513132904.GE44225@bfoster>
In-Reply-To: <20200513132904.GE44225@bfoster>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Foster <bfoster@redhat.com>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Oh yeah.  You're right.  This patch isn't correct.  Sorry about that.

I worry that there are several static analyzer's which will warn about
this code...

regards,
dan carpenter
