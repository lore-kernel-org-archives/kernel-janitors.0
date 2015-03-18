From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Mar 2015 12:57:26 +0000
Subject: Re: [PATCH] Staging: dgnc: release the lock before testing for nullity
Message-Id: <20150318125726.GQ10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426683112-24182-1-git-send-email-lambert.quentin@gmail.com>
In-Reply-To: <1426683112-24182-1-git-send-email-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: devel@driverdev.osuosl.org, Lidza Louina <lidza.louina@gmail.com>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

This patch has no changelog.  What's the bug?

On Wed, Mar 18, 2015 at 01:51:52PM +0100, Quentin Lambert wrote:
> Fixes: c84a083b995b ("Staging: dgnc: Use goto for spinlock release before return")
> 

Don't put a blank line here.

> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>


regards,
dan carpenter

