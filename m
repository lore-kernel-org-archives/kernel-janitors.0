From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 21 Sep 2017 23:09:46 +0000
Subject: Re: [PATCH] lib/lz4: make arrays static const, reduces object code size
Message-Id: <5aab65d9-6da6-c770-b5aa-9edbdda31dec@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921221939.20820-1-colin.king@canonical.com>
In-Reply-To: <20170921221939.20820-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Sven Schmidt <4sschmid@informatik.uni-hamburg.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Le 22/09/2017 à 00:19, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the read-only arrays dec32table and dec64table on the
> stack, instead make them both static const.  Makes the object code
> smaller by over 10K bytes:
10k? Wouaouh! This is way much more than what you usually win with such 
patches.
I assume we must thanks FORCE_INLINE in this case.
Nice catch!

CJ

> Before:
>     text	   data	    bss	    dec	    hex	filename
>    31500	      0	      0	  31500	   7b0c	lib/lz4/lz4_decompress.o
>
> After:
>     text	   data	    bss	    dec	    hex	filename
>    20237	    176	      0	  20413	   4fbd	lib/lz4/lz4_decompress.o
>
> (gcc version 7.2.0 x86_64)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   lib/lz4/lz4_decompress.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/lz4/lz4_decompress.c b/lib/lz4/lz4_decompress.c
> index bd3574312b82..141734d255e4 100644
> --- a/lib/lz4/lz4_decompress.c
> +++ b/lib/lz4/lz4_decompress.c
> @@ -85,8 +85,8 @@ static FORCE_INLINE int LZ4_decompress_generic(
>   	const BYTE * const lowLimit = lowPrefix - dictSize;
>   
>   	const BYTE * const dictEnd = (const BYTE *)dictStart + dictSize;
> -	const unsigned int dec32table[] = { 0, 1, 2, 1, 4, 4, 4, 4 };
> -	const int dec64table[] = { 0, 0, 0, -1, 0, 1, 2, 3 };
> +	static const unsigned int dec32table[] = { 0, 1, 2, 1, 4, 4, 4, 4 };
> +	static const int dec64table[] = { 0, 0, 0, -1, 0, 1, 2, 3 };
>   
>   	const int safeDecode = (endOnInput = endOnInputSize);
>   	const int checkOffset = ((safeDecode) && (dictSize < (int)(64 * KB)));


