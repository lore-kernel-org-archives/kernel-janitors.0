From: Christoph Hellwig <hch@lst.de>
Date: Thu, 31 May 2018 16:39:19 +0000
Subject: Re: [PATCH][next] aio: fix missing break in switch statement
Message-Id: <20180531163919.GB31181@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180530180415.17572-1-colin.king@canonical.com>
In-Reply-To: <20180530180415.17572-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 30, 2018 at 07:04:15PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The addition of the IOCB_CMD_POLL command removed the break
> statement for the IOCM_CMD_FDSYNC. From my understanding, this
> should not have been removed as the fall-through does not seem
> to make sense.  Fix this by adding the break back again.
> 
> Detected by CoverityScan, CID#1469469 ("Missing break in switch")

Thanks.  I've actually send a fix to Al for this a few days ago
already.
