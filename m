From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2013 21:15:13 +0000
Subject: Re: [patch] leds: renesas-tpu: cleanup a small type issue
Message-Id: <20130529211513.GK23987@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130529070150.GC25133@debian>
In-Reply-To: <20130529070150.GC25133@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, May 29, 2013 at 07:34:39PM +0200, walter harms wrote:

> int would be a more "natural" choice.
> 

You should never use signed types for a bit field.  That's just
asking for a sign expansion bug.

regards,
dan carpenter

