From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Apr 2014 09:45:55 +0000
Subject: Re: [PATCH] Staging:dgap:dgap_tty.c: Upgraded driver to use Mutex instead of semaphore
Message-Id: <20140422094555.GD26890@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1397750132-21296-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1397750132-21296-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, lidza.louina@gmail.com

On Thu, Apr 17, 2014 at 09:25:32PM +0530, Kumar Gaurav wrote:
> dgap driver uses semaphore for obtaining lock. I upgraded it to use MUTEX.
> 

You are patching ancient code that doesn't exist.  Work against
linux-next.

regards,
dan carpenter

