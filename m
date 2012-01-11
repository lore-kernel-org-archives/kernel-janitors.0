From: Jeff Layton <jlayton@samba.org>
Date: Wed, 11 Jan 2012 12:20:29 +0000
Subject: Re: [patch] cifs: integer overflow in parse_dacl()
Message-Id: <20120111072029.672dfdca@tlielax.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120111074627.GA4519@elgon.mountain>
In-Reply-To: <20120111074627.GA4519-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, 11 Jan 2012 10:46:27 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On 32 bit systems num_aces * sizeof(struct cifs_ace *) could overflow
> leading to a smaller ppace buffer than we expected.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/cifs/cifsacl.c b/fs/cifs/cifsacl.c
> index 72ddf23..c1b2544 100644
> --- a/fs/cifs/cifsacl.c
> +++ b/fs/cifs/cifsacl.c
> @@ -909,6 +909,8 @@ static void parse_dacl(struct cifs_acl *pdacl, char *end_of_acl,
>  		umode_t group_mask = S_IRWXG;
>  		umode_t other_mask = S_IRWXU | S_IRWXG | S_IRWXO;
>  
> +		if (num_aces > ULONG_MAX / sizeof(struct cifs_ace *))
> +			return;
>  		ppace = kmalloc(num_aces * sizeof(struct cifs_ace *),
>  				GFP_KERNEL);
>  		if (!ppace) {


Looks plausible. This function could use some work. I'm not sure why
num_aces is signed here too...

The first arg to kmalloc is a size_t. Does that boil down to an unsigned
long on all arches?

-- 
Jeff Layton <jlayton@samba.org>
