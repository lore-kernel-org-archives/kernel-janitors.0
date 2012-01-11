From: Jeff Layton <jlayton@samba.org>
Date: Wed, 11 Jan 2012 18:20:53 +0000
Subject: Re: [patch] cifs: integer overflow in parse_dacl()
Message-Id: <20120111132053.467e8cae@tlielax.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120111074627.GA4519@elgon.mountain>
	<CADT32eLVwQT9V67BX8TkjVHDnQoYS7OqA_-xbnjY57ZXO3EfsA@mail.gmail.com>
	<CAH2r5muDQUL=0HcoFHH3QvP7C2pyy0=S9ESFBcm=qOYg3ESdxQ@mail.gmail.com>
In-Reply-To: <CAH2r5muDQUL=0HcoFHH3QvP7C2pyy0=S9ESFBcm=qOYg3ESdxQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Steve French <smfrench-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shirish Pargaonkar <shirishpargaonkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, 11 Jan 2012 11:24:03 -0600
Steve French <smfrench@gmail.com> wrote:

> On Wed, Jan 11, 2012 at 9:50 AM, Shirish Pargaonkar
> <shirishpargaonkar@gmail.com> wrote:
> > On Wed, Jan 11, 2012 at 1:46 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >> On 32 bit systems num_aces * sizeof(struct cifs_ace *) could overflow
> >> leading to a smaller ppace buffer than we expected.
> >>
> >> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >>
> >> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
> >> index 72ddf23..c1b2544 100644
> >> --- a/fs/cifs/cifsacl.c
> >> +++ b/fs/cifs/cifsacl.c
> >> @@ -909,6 +909,8 @@ static void parse_dacl(struct cifs_acl *pdacl, char *end_of_acl,
> >>                umode_t group_mask = S_IRWXG;
> >>                umode_t other_mask = S_IRWXU | S_IRWXG | S_IRWXO;
> >>
> >> +               if (num_aces > ULONG_MAX / sizeof(struct cifs_ace *))
> >
> > Should an error/warning (like cifs client can't handle these many aces or
> > possible erroneous number of aces sent by server etc.) be logged before
> > returning?
> >
> >> +                       return;
> >>                ppace = kmalloc(num_aces * sizeof(struct cifs_ace *),
> >>                                GFP_KERNEL);
> >>                if (!ppace) {
> 
> Perhaps.   Also note that you would overflow maximum smb size if num
> aces is huge
> so would you have even gotten this far?
> 

Only if the smb frame is properly formed. It's possible that it's
corrupt in such a way that the num_aces field is much larger than it
should be, but the rest of the frame looks OK.

-- 
Jeff Layton <jlayton@samba.org>
