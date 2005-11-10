From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 10 Nov 2005 17:38:22 +0000
Subject: [KJ] Re: [PATCH 8/8] Inline 3 functions
Message-Id: <20051110173822.GD5376@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39867629414663375=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <436FF51D.8080509@us.ibm.com> <436FF894.8090204@us.ibm.com> <Pine.LNX.4.58.0511080937060.9530@sbz-30.cs.Helsinki.FI> <4370F7AE.5090505@us.ibm.com> <20051110104211.GB5376@stusta.de> <43737D94.2060408@us.ibm.com>
In-Reply-To: <43737D94.2060408@us.ibm.com>
To: Matthew Dobson <colpatch@us.ibm.com>
Cc: Pekka J Enberg <penberg@cs.Helsinki.FI>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============39867629414663375==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 10, 2005 at 09:04:20AM -0800, Matthew Dobson wrote:
> Adrian Bunk wrote:
> > 
> >>Well, no, they aren't on the hot path.  I just figured since they are only
> >>ever called from one other function, why not inline them?  If the sentiment
> >>is that it's a BAD idea, I'll drop it.
> > 
> > 
> > And if there will one day be a second caller, noone will remember to 
> > remove the inline...
> 
> So are you suggesting that we don't mark these functions 'inline', or are
> you just pointing out that we'll need to drop the 'inline' if there is ever
> another caller?

I'd suggest to not mark them 'inline'.

> -Matt

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============39867629414663375==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39867629414663375==--
