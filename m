From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Wed, 26 Aug 2009 22:42:00 +0000
Subject: Re: memcpy
Message-Id: <200908270042.00597.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4A95B4B4.3020408@uiuc.edu>
In-Reply-To: <4A95B4B4.3020408@uiuc.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Donnerstag 27 August 2009 00:18:28 schrieb Stoyan Gaydarov:
> I wanted to know what memcpy returned as a result, and if it
> needs/should be checked. There are several places in the kernel where i
> noticed it being used but i also saw a warning about the result not
> being used, so i wanted to know a little more about it.
>
> -Stoyan
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors"
> in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



Hi,

*memcpy is defined in .../lib/string.c  (+ some macros etc - use cscope to 
find more references) as

/**
 * memcpy - Copy one area of memory to another
 * @dest: Where to copy to
 * @src: Where to copy from
 * @count: The size of the area.
 *
 * You should not use this function to access IO space, use memcpy_toio()
 * or memcpy_fromio() instead.
 */
void *memcpy(void *dest, const void *src, size_t count)
{
    char *tmp = dest;
    const char *s = src;

    while (count--)
        *tmp++ = *s++;
    return dest;
}

You can see it just returns the destination address that you have passed to it
-> so I guess unless it is possible that you have already passed it a null 
pointer (which might horribly fail) it is not really necessary to check the 
result.


Peter

