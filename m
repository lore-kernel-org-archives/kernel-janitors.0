From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 20 Jan 2013 17:21:51 +0000
Subject: Re: [patch] usb: gadget: precedence bug in show_requests()
Message-Id: <20130120172151.GQ4584@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120145044.GA32551@elgon.mountain>
In-Reply-To: <20130120145044.GA32551@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jan 20, 2013 at 09:10:24PM +0400, Sergei Shtylyov wrote:
> Hello.
> 
> On 20-01-2013 18:50, Dan Carpenter wrote:
> 
> >The mod operation has higher precedence than the divide
> 
>   They are of the same priority AFAIR, but that doesn't matter since
> these operations are executed left to right.
> 

Oh yeah, you're right.  I feel dumb now.  Let me resend with a
different changelog.

regards,
dan carpenter

