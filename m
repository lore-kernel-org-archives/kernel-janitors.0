From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Sat, 25 Feb 2006 20:42:01 +0000
Subject: Re: [KJ] [PATCH] check request_region return value
Message-Id: <200602252142.02236.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602242249.22568.tim@aapopfiets.nl>
In-Reply-To: <200602242249.22568.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 25 February 2006 18:34, Jesper Juhl wrote:
> Ahh yes, looking a bit more closely at the code I see that's true.
> Hmm, there's got to be a cleaner way, the result of your patch is a
> pretty ugly error path...
Pretty much the only alternative I can think of is something like this: 

if (condition && request_region(x)) {
        if (condition && request_region(y)) {
                /* ... */
        } else {
                release_region(x);
        }
}

In this case, it will become a nine-level deep nest, and it's not much 
different from my original version.

Having done some research, I don't think the checks are necessary.  
request_region() (actually __request_resource()) does some checks which I'm 
pretty sure will catch any 0 passed to it.  The GPE odd/even checks will 
still have to be done, though.

I'll make a patch without most of the checks, unless anyone objects to 
removing them.

Tim
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
