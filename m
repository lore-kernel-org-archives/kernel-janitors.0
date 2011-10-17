From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Oct 2011 14:18:34 +0000
Subject: Re: [patch] CIFS: cleanup min_t() cast in cifs_read()
Message-Id: <20111017141834.GP30887@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111017073018.GC7812@elgon.mountain>
 <CAH2r5mufq0=BsZvfGuVdd1BU-gxRpnUmWAm-vzhsOR4KbvGSbg@mail.gmail.com>
In-Reply-To: <CAH2r5mufq0=BsZvfGuVdd1BU-gxRpnUmWAm-vzhsOR4KbvGSbg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <smfrench-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Oct 17, 2011 at 09:10:01AM -0500, Steve French wrote:
> I prefer the change to unsigned int rather than u32 so it is clearer
> that you are not casting the value from 64 bit to 32 bit on some
> architectures.  To avoid reformatting can't you can use "uint" if you
> want the shorter form see:
> 
> include/linux/types.h:typedef unsigned int		uint;
> 

Yes.  That looks nicer.  I'll resend.

regards,
dan carpenter

