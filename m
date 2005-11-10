From: Oliver Neukum <oliver@neukum.org>
Date: Thu, 10 Nov 2005 19:22:52 +0000
Subject: [KJ] Re: [PATCH 8/8] Inline 3 functions
Message-Id: <200511102022.52702.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <200511101904.23114.oliver@neukum.org> <20051110182001.GF5376@stusta.de>
In-Reply-To: <20051110182001.GF5376@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Bunk <bunk@stusta.de>
Cc: Matthew Dobson <colpatch@us.ibm.com>, Pekka J Enberg <penberg@cs.helsinki.fi>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

Am Donnerstag, 10. November 2005 19:20 schrieb Adrian Bunk:
> On Thu, Nov 10, 2005 at 07:04:22PM +0100, Oliver Neukum wrote:
> > Am Donnerstag, 10. November 2005 18:38 schrieb Adrian Bunk:
> > > > So are you suggesting that we don't mark these functions 'inline', or are
> > > > you just pointing out that we'll need to drop the 'inline' if there is ever
> > > > another caller?
> > > 
> > > I'd suggest to not mark them 'inline'.
> > 
> > It seems you have found one more use for sparse. How about a tag
> > like __single_inline that will cause a warning if a function having it
> > is called from more than one place?
> 
> Why should such a function be manually marked "inline" at all?
> 
> If a static function is called exactly once it is the job of the 
> compiler to inline the function.

It should indeed. This documentation says it does:
http://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
That makes me wonder what is the problem.

	Puzzeled
		Oliver
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
