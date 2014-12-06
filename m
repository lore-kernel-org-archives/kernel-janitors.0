From: Wesley Wiser <wwiser@gmail.com>
Date: Sat, 06 Dec 2014 03:28:06 +0000
Subject: Re: [PATCH] checkpatch: allow uppercase logging function names
Message-Id: <1417836486.4713.2.camel@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417660721-13330-1-git-send-email-wwiser@gmail.com>
In-Reply-To: <1417660721-13330-1-git-send-email-wwiser@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Joe, 

Thanks for taking a look at this. Do you think I should look into
fixing the casing of these functions instead? Some of these functions
look like they're being called in a lot of places. TP_printk, for
example, is getting called over 1000 times according to git grep. 

Wesley Wiser

On Wed, 2014-12-03 at 18:47 -0800, Joe Perches wrote:
> I'm not sure that these should be encouraged.
> I'd prefer to make these lower case instead.
> 
> The regex also allows mixed case like Tp_printk.
> 
> Maybe if it was something like
> (?:[a-z0-9]+_|[A-Z0-9]+_){1,2}
> 
> but it still seems undesirable.


