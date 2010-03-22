From: walter harms <wharms@bfs.de>
Date: Mon, 22 Mar 2010 17:18:04 +0000
Subject: Re: [patch v2] cx231xx: card->driver "Conexant cx231xx Audio" too
Message-Id: <4BA7A64C.4060202@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322153909.GC23411@bicker>
In-Reply-To: <20100322153909.GC23411@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Takashi Iwai schrieb:
> At Mon, 22 Mar 2010 08:43:47 -0700,
> Joe Perches wrote:
>> On Mon, 2010-03-22 at 18:39 +0300, Dan Carpenter wrote:
>>> card->driver is 15 characters and a NULL, the original code could 
>>> cause a buffer overflow.
>>> In version 2, I used a better name that Takashi Iwai suggested.
>> Perhaps it's better to use strncpy as well.
> 
> strlcpy() would be safer :)
> 
> But, in such a case, we want rather that the error is notified at
> build time.
> 
> Maybe a macro like below would be helpful to catch such bugs?
> 
> #define COPY_STRING(buf, src)						\
> 	do {								\
> 		if (__builtin_constant_p(src))				\
> 			BUILD_BUG_ON(strlen(src) >= sizeof(buf));	\
> 		strcpy(buf, src);					\
> 	} while (0)
> 
> and used like:
> 
> struct foo {
> 	char foo[5];
> } x;
> 
> COPY_STRING(x.foo, "OK"); // OK
> COPY_STRING(x.foo, "1234567890"); // NG
> 
> 
> Takashi
> --


did i miss something ?
why not change  card->driver int char * ? a simple card->driver="name"
would solve the problem.

re,
 wh



