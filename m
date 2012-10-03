From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Oct 2012 12:43:39 +0000
Subject: Re: [patch] cifs: proper fix for integer overflow in parse_dacl()
Message-Id: <20121003124339.GA4671@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927204908.GA13222@elgon.mountain>
In-Reply-To: <20120927204908.GA13222-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
Cc: linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Thu, Sep 27, 2012 at 11:49:08PM +0300, Dan Carpenter wrote:
> I tried to fix this before by adding the ULONG_MAX check, but num_aces
> is an unsigned int so it should have been UINT_MAX.  Sorry for that.
> These days we can just call kmalloc_array() which has the overflow check
> built in.
> 

Uh...  It turns out that I still suck at understanding C.  My first
patch was fine.  Sorry for the noise.

regards,
dan carpenter

