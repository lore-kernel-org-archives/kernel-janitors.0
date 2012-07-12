From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 16:24:39 +0000
Subject: Re: [patch] Extcon: Arizona: unlock on an error in arizona_micdet()
Message-Id: <20120712162439.GG6056@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063602.GG11812@elgon.mountain>
In-Reply-To: <20120711063602.GG11812@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 12, 2012 at 06:19:29PM +0200, walter harms wrote:
> nitpicking:
> normally you unlock before dev_err() and is the msg ok ?
> IMHO  "Failed to read ARIZONA_MIC_DETECT_3:%d\n" seems more obvious,
> (I really do not know that device)
> 

It's not a bad idea if someone wants to send a follow on patch.  I
just matched the rest of the function.

regards,
dan carpenter

