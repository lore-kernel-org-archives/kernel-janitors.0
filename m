From: Dan Carpenter <error27@gmail.com>
Date: Tue, 12 Jul 2011 18:20:39 +0000
Subject: Re: [patch] cifs: update limit for snprintf() in
Message-Id: <20110712182039.GJ18655@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110617103059.GE2520@shale.localdomain>
 <CAH2r5mu6TuWs6P8ZeR1=KCv8BLSu0_Z8b2uoVUqXhw55=39CWg@mail.gmail.com>
In-Reply-To: <CAH2r5mu6TuWs6P8ZeR1=KCv8BLSu0_Z8b2uoVUqXhw55=39CWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <smfrench-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, "open list:COMMON INTERNET F..." <linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:COMMON INTERNET F..." <samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jul 12, 2011 at 01:14:00PM -0500, Steve French wrote:
> What about the following alternative, so we dont rely on the magic
> number as much.
> 

Yeah.  That's better.  Want me to do anything or will you just give
me the reported-by?

regards,
dan carpenter

