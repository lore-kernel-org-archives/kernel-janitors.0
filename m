From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Jan 2020 16:32:02 +0000
Subject: Re: [PATCH] net/rose: remove redundant assignment to variable failed
Message-Id: <20200107163202.GD27042@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107152415.106353-1-colin.king@canonical.com>
 <20200107161827.GO3911@kadam>
In-Reply-To: <20200107161827.GO3911@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "David S . Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Never mind.  I misread what the code is doing.  Your patch is correct.
My patch would have been harmless but made the code even more confusing.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
