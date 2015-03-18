From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Mar 2015 13:36:51 +0000
Subject: Re: [PATCH v2] Staging: dgnc: release the lock before testing for nullity
Message-Id: <20150318133651.GS10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426684868-24402-1-git-send-email-lambert.quentin@gmail.com>
In-Reply-To: <1426684868-24402-1-git-send-email-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Lidza Louina <lidza.louina@gmail.com>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 18, 2015 at 02:21:08PM +0100, Quentin Lambert wrote:
> The refactoring intrduced in
> c84a083b995b ("Staging: dgnc: Use goto for spinlock release before return")
> inverts the order in which the lock is released and ld is tested for nullity.
> 
> This patch restores the execution flow.
> 

This changelog still doesn't make sense so I took a look at the code.

tty_ldisc_deref() is an unlock function.  So this is a lock ordering
bug.  What makes you think the original ordering was correct?  Who
reported this bug?  What are the effects of this bug?

Please answer the questions and we can work together on a proper fix if
needed.

regards,
dan carpenter

