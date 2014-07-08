From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Jul 2014 11:49:06 +0000
Subject: Re: [PATCH] staging: rtl8192ee: Correct bitmask in comparsion
Message-Id: <20140708114906.GN25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404517213-4067-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1404517213-4067-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Larry.Finger@lwfinger.net, linux-kernel@vger.kernel.org, drivers_staging@kernel-bugs.osdl.org

On Sat, Jul 05, 2014 at 02:40:13AM +0300, Andrey Utkin wrote:
> See https://bugzilla.kernel.org/show_bug.cgi?idx041
> ---8<---
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>

Following the link to bugzilla, this is a static checker fix.

As far as I can see this patch is just based on guess work?  Otherwise
put some kind of description why your fix is correct in the changelog.

regards,
dan carpenter

