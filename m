From: walter harms <wharms@bfs.de>
Date: Mon, 28 Mar 2005 14:34:16 +0000
Subject: [KJ] critical bug in strncpy()
Message-Id: <424815E8.8060200@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26137851064022533=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503281155.16199.vicente.feito@gmail.com>
In-Reply-To: <200503281155.16199.vicente.feito@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============26137851064022533==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

hi all,
The kernel version of strcpy() is buggy. it copies ALWAYS n bytes.
since i have NO idea if this is exploidable somehow, i would still
recomend to REMOVE the code. See example below if you do not believe me.
Also below you find a sniplet from libString/Strncpy.c.
i did not provide a patch since this is NOT my code. (btw: changed the 
name from Strncopy to strncpy). C&P this in to the kernel/lib/string.c.


re,
	walter


/* in case this is needed */
Signed-off-by: walter harms <wharms@bfs.de>



/* linux kernel */
char * K_strncpy(char * dest,const char *src,size_t count)
{
         char *tmp = dest;

         while (count) {
                 if ((*tmp = *src) != 0) src++;    <-MISSING  case == 0 

                 tmp++;
                 count--;
         }
         printf("count=%d\n",count);
         return dest;
}

int main()
{
char *src="15" ;
char dst[]="123";

K_strncpy(dst,src,500);

}


i looked a bit around and found these nice version.


/*
  * libString, Copyright (C) 1999 Patrick Alken
  * This library comes with absolutely NO WARRANTY
  *
  * Should you choose to use and/or modify this source code, please
  * do so under the terms of the GNU General Public License under which
  * this library is distributed.
  *
  * $Id: Strncpy.c,v 1.1.1.1 2000/10/02 12:02:27 decho Exp $
  */

#include <sys/types.h>

/*
Strncpy()
  Optimized version of strncpy().

Inputs: dest   - destination string
         source - source string
         bytes  - number of bytes to copy

NOTE: A terminating \0 character is only copied to 'dest' if
       'source' is terminated by one, provided the limit 'bytes'
       has not yet been reached.

Return: destination string
*/

char *
strncpy(char *dest, const char *source, const size_t bytes)

{
   register char *end = dest + bytes;
   register char *s = dest;

   while ((s < end) && (*s++ = *source++))
     ;

   return (dest);
} /* Strncpy() */



--===============26137851064022533==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26137851064022533==--
