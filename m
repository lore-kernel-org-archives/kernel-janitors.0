From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 06 Aug 2020 22:36:21 +0000
Subject: Re: [PATCH] input: sentelic: fix error return when fsp_reg_write fails
Message-Id: <20200806223621.GM1665100@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603141218.131663-1-colin.king@canonical.com>
In-Reply-To: <20200603141218.131663-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Tai-hwa Liang <avatar@sentelic.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 03, 2020 at 03:12:18PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to fsp_reg_write fails -EIO is not being returned
> because the count is being returned instead of the return value in retval.
> Fix this by returning the value in retval instead of count.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: fc69f4a6af49 ("Input: add new driver for Sentelic Finger Sensing Pad")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

-- 
Dmitry
