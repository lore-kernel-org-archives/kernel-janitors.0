From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Oct 2011 20:48:30 +0000
Subject: Re: [patch] Input: force feedback - potential integer wrap in
Message-Id: <20111010204830.GV30887@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111009162524.GA14049@elgon.mountain>
 <20111010050852.GA18794@core.coreip.homeip.net>
In-Reply-To: <20111010050852.GA18794@core.coreip.homeip.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Oct 09, 2011 at 10:08:52PM -0700, Dmitry Torokhov wrote:
> Instead of doing this why don't we mark all relevant fields as unsigned
> int?
> 

Sure.  We'd still have to check for wrapping on 32bit I think...

I'll sent a patch for this tomorrow.

regards,
dan carpenter

