From: walter harms <wharms@bfs.de>
Date: Mon, 28 Mar 2005 15:31:58 +0000
Subject: Re: [KJ] critical bug in strncpy()
Message-Id: <4248236E.7080104@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45860313764293537=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503281155.16199.vicente.feito@gmail.com>
In-Reply-To: <200503281155.16199.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============45860313764293537==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi all,

i do not think this is intended. surely you copy data from
src to tmp++ but using a large value (> strlen(src) ) for count will 
access some strange areas where no code should go.

the defined behavier of strncpy is to copy a string that terminates with 
\0, count describes an upper limit what is reached first should 
terminate the copy. every version of strncpy works that way.
maybe its not an critical bug (as src is not increased)  but
1. it *will* access unintended areas beyond  \0
2. rule of least surprise is violated
3. other ppl may find other uses to this bug
4. the fix is simple

re,
	walter


Ryan Anderson wrote:
> On Mon, Mar 28, 2005 at 04:34:16PM +0200, walter harms wrote:
> 
>>hi all,
>>The kernel version of strcpy() is buggy. it copies ALWAYS n bytes.
>>since i have NO idea if this is exploidable somehow, i would still
>>recomend to REMOVE the code. See example below if you do not believe me.
>>Also below you find a sniplet from libString/Strncpy.c.
> 
> 
> The kernel version prevents information leakage by overwriting the rest
> of the buffer with 0 after finishing the actual copy.
> 
> I'm fairly certain the behavior was intendend.
> 
> 
>>i did not provide a patch since this is NOT my code. (btw: changed the 
>>name from Strncopy to strncpy). C&P this in to the kernel/lib/string.c.
>>
>>
>>re,
>>	walter
>>
>>
>>/* in case this is needed */
>>Signed-off-by: walter harms <wharms@bfs.de>
>>
>>
>>
>>/* linux kernel */
>>char * K_strncpy(char * dest,const char *src,size_t count)
>>{
>>        char *tmp = dest;
>>
>>        while (count) {
>>                if ((*tmp = *src) != 0) src++;    <-MISSING  case == 0 
>>
>>                tmp++;
>>                count--;
>>        }
>>        printf("count=%d\n",count);
>>        return dest;
>>}
>>
>>int main()
>>{
>>char *src="15" ;
>>char dst[]="123";
>>
>>K_strncpy(dst,src,500);
>>
>>}
>>
>>
>>i looked a bit around and found these nice version.
>>
>>
>>/*
>> * libString, Copyright (C) 1999 Patrick Alken
>> * This library comes with absolutely NO WARRANTY
>> *
>> * Should you choose to use and/or modify this source code, please
>> * do so under the terms of the GNU General Public License under which
>> * this library is distributed.
>> *
>> * $Id: Strncpy.c,v 1.1.1.1 2000/10/02 12:02:27 decho Exp $
>> */
>>
>>#include <sys/types.h>
>>
>>/*
>>Strncpy()
>> Optimized version of strncpy().
>>
>>Inputs: dest   - destination string
>>        source - source string
>>        bytes  - number of bytes to copy
>>
>>NOTE: A terminating \0 character is only copied to 'dest' if
>>      'source' is terminated by one, provided the limit 'bytes'
>>      has not yet been reached.
>>
>>Return: destination string
>>*/
>>
>>char *
>>strncpy(char *dest, const char *source, const size_t bytes)
>>
>>{
>>  register char *end = dest + bytes;
>>  register char *s = dest;
>>
>>  while ((s < end) && (*s++ = *source++))
>>    ;
>>
>>  return (dest);
>>} /* Strncpy() */
>>
>>
> 
> 
>>_______________________________________________
>>Kernel-janitors mailing list
>>Kernel-janitors@lists.osdl.org
>>http://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 
> 

--===============45860313764293537==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45860313764293537==--
