From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 10 Nov 2017 15:26:36 +0000
Subject: Re: [PATCH] block: avoid null pointer dereference on null disk
Message-Id: <47f5fa8a-136f-a7c3-d713-363983653d2d@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171106175353.20199-1-colin.king@canonical.com>
In-Reply-To: <20171106175353.20199-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/06/2017 10:53 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It is possible that the pointer disk can be null and hence
> we can get a null pointer deference when accessing disk->flags.
> Add a null pointer check to avoid the dereference.

Applied, thanks.

-- 
Jens Axboe

