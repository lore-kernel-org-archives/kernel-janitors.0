From: walter harms <wharms@bfs.de>
Date: Sun, 06 Mar 2011 17:11:23 +0000
Subject: Re: [patch] cifs: writing past the end of the array
Message-Id: <4D73C03B.1050905@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110306132621.GN3416@bicker>
In-Reply-To: <20110306132621.GN3416@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



Am 06.03.2011 14:26, schrieb Dan Carpenter:
> This is a cut and paste error.  p16 only has 16 chars, not 21.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/cifs/smbencrypt.c b/fs/cifs/smbencrypt.c
> index 3967635..1525d5e 100644
> --- a/fs/cifs/smbencrypt.c
> +++ b/fs/cifs/smbencrypt.c
> @@ -353,7 +353,7 @@ SMBNTencrypt(unsigned char *passwd, unsigned char *c8, unsigned char *p24)
>  	int rc;
>  	unsigned char p16[16], p21[21];
>  
> -	memset(p16, '\0', 21);
> +	memset(p16, '\0', 16);
>  	memset(p21, '\0', 21);
>  
>  	rc = E_md4hash(passwd, p16);


perhaps ARRAY_SIZE() instead of a magic number is a better choice ?

re,
 wh
