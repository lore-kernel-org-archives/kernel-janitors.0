From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 May 2013 05:44:13 +0000
Subject: Re: [patch] leds: renesas-tpu: cleanup a small type issue
Message-Id: <20130531054413.GN23987@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130529070150.GC25133@debian>
In-Reply-To: <20130529070150.GC25133@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 30, 2013 at 10:59:49AM -0700, Bryan Wu wrote:
> But unsigned int is not always 32 bits and unsigned short is not
> always 16 bits on every platform.
> 

On all linux platforms they are though.

regards,
dan carpenter

