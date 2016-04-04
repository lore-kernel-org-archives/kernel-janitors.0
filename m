From: Jiri Kosina <jikos@kernel.org>
Date: Mon, 04 Apr 2016 07:50:11 +0000
Subject: Re: [patch] HID: hidraw: silence an uninitialized variable warning
Message-Id: <alpine.LNX.2.00.1604040950030.16158@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160402044501.GB11775@mwanda>
In-Reply-To: <20160402044501.GB11775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2 Apr 2016, Dan Carpenter wrote:

> My static checker complains that "devid" can be uninitialized if
> alloc_chrdev_region() fails.  Fix this by moving the error hanling
> forward a couple lines.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.

-- 
Jiri Kosina
SUSE Labs

