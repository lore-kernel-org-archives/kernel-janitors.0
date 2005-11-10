From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 10 Nov 2005 18:20:01 +0000
Subject: [KJ] Re: [PATCH 8/8] Inline 3 functions
Message-Id: <20051110182001.GF5376@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63751763360175939=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <43737D94.2060408@us.ibm.com> <20051110173822.GD5376@stusta.de> <200511101904.23114.oliver@neukum.org>
In-Reply-To: <200511101904.23114.oliver@neukum.org>
To: Oliver Neukum <oliver@neukum.org>
Cc: Matthew Dobson <colpatch@us.ibm.com>, Pekka J Enberg <penberg@cs.helsinki.fi>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============63751763360175939==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 10, 2005 at 07:04:22PM +0100, Oliver Neukum wrote:
> Am Donnerstag, 10. November 2005 18:38 schrieb Adrian Bunk:
> > > So are you suggesting that we don't mark these functions 'inline', or are
> > > you just pointing out that we'll need to drop the 'inline' if there is ever
> > > another caller?
> > 
> > I'd suggest to not mark them 'inline'.
> 
> It seems you have found one more use for sparse. How about a tag
> like __single_inline that will cause a warning if a function having it
> is called from more than one place?

Why should such a function be manually marked "inline" at all?

If a static function is called exactly once it is the job of the 
compiler to inline the function.

> 	Regards
> 		Oliver

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============63751763360175939==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63751763360175939==--
