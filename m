From: Ben Romer <benjamin.romer@unisys.com>
Date: Tue, 12 Jan 2016 16:26:47 +0000
Subject: Re: [patch] staging: unisys: remove some dead code
Message-Id: <56952947.1050104@unisys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160107093413.GA27186@mwanda>
In-Reply-To: <20160107093413.GA27186@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 01/07/2016 04:34 AM, Dan Carpenter wrote:
> queue_delayed_work() returns bool, not negative error codes.  It returns
> false if the work has already been queued or true otherwise.  Since
> we don't care about that, we can just remove the test.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Tested with s-Par, works fine (of course). :)

Signed-off-by: Benjamin Romer <benjamin.romer@unisys.com>

