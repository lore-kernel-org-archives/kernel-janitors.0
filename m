From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 16:54:30 +0000
Subject: Re: [patch v2] cx231xx: card->driver "Conexant cx231xx Audio" too
Message-Id: <20100322165430.GU21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100319114957.GQ5331@bicker> <s5hr5ncxvm9.wl%tiwai@suse.de> <20100322153909.GC23411@bicker> <1269272627.22616.35.camel@Joe-Laptop.home> <s5h39zsxryw.wl%tiwai@suse.de>
In-Reply-To: <s5h39zsxryw.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Joe Perches <joe@perches.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Srinivasa Deevi <srinivasa.deevi@conexant.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 22, 2010 at 05:04:55PM +0100, Takashi Iwai wrote:
> At Mon, 22 Mar 2010 08:43:47 -0700,
> Joe Perches wrote:
> > 
> > On Mon, 2010-03-22 at 18:39 +0300, Dan Carpenter wrote:
> > > card->driver is 15 characters and a NULL, the original code could 
> > > cause a buffer overflow.
> > 
> > > In version 2, I used a better name that Takashi Iwai suggested.
> > 
> > Perhaps it's better to use strncpy as well.
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

I can do the same thing with Smatch.  The smatch check can also find 
bugs like this:

	buf = kmalloc(10, GFP_KERNEL);
	strcpy(buf, "1234567890"); 

I used smatch to find this bug and 5 others on my allmodconfig w/ staging.
I also found 19 other places that use strcpy() to copy from a large buffer
into a smaller buffer.

Your idea is nice, but I think anyone who deliberately uses the new
macro is not going to have the bug in the first place.  ;)

regards,
dan carpenter

> 
> Takashi
