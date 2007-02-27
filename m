From: "Bernhard R. Link" <brlink@debian.org>
Date: Tue, 27 Feb 2007 17:31:18 +0000
Subject: Re: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <20070227173117.GB18930@pcpool00.mathematik.uni-freiburg.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225173528.GB3595@localhost.localdomain>
In-Reply-To: <20070225173528.GB3595@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

* burns.ethan@gmail.com <burns.ethan@gmail.com> [070227 17:41]:
> Looks like strlcpy() would solve both these problems.

While there may be cases where it is useful, it normaly solves
a problem that is not there.

        ssize = strlen(src) + 1;
        if( ssize > dsize )
                return ERROR;
        memcpy(dest, src, ssize);

is the same like

> 	ssize = strlcpy(dest, src, dsize);
> 	if (ssize >= dsize - 1)
> 		return ERROR;
> 
> Here we have dest guarenteed to be terminated, and if the source string is
> greater than the dest - 1 (for the '\0'), we can bail out.

except you test for greater or equal instead of greater ;->

Hochachtungsvoll,
	Bernhard R. Link
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
