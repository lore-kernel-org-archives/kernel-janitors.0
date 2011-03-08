From: Dan Carpenter <error27@gmail.com>
Date: Tue, 08 Mar 2011 11:05:12 +0000
Subject: Re: [patch] cifs: writing past the end of the array
Message-Id: <20110308110512.GB3416@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110306132621.GN3416@bicker>
In-Reply-To: <20110306132621.GN3416@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 08, 2011 at 09:25:36AM +0100, walter harms wrote:
> >>> --- a/fs/cifs/smbencrypt.c
> >>> +++ b/fs/cifs/smbencrypt.c
> >>> @@ -353,7 +353,7 @@ SMBNTencrypt(unsigned char *passwd, unsigned char *c8, unsigned char *p24)
> >>>  	int rc;
> >>>  	unsigned char p16[16], p21[21];
> >>>  
> >>> -	memset(p16, '\0', 21);
> >>> +	memset(p16, '\0', 16);
> >>>  	memset(p21, '\0', 21);
> >>>  
> >>>  	rc = E_md4hash(passwd, p16);
> >>
> >>
> >> perhaps ARRAY_SIZE() instead of a magic number is a better choice ?
> >>
> > 
> > Agreed. Care to propose a patch? There are almost certainly other
> > places in the code that could use a similar cleanup.
> > 
> 
> Dan, i think he is sending to you :)
> 

Nah, man.  He's talking to you.  :P

The 16 can't change.  It's built into the name.  Also you should
probably use sizeof() instead of ARRAY_SIZE().  They're the same in this
case because it's type char but sizeof is more standard.

regards,
dan carpenter

