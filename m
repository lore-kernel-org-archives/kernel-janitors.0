From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 20 Jan 2005 17:02:36 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050120170236.GB3174@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18720879333264806=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============18720879333264806==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2005 at 11:06:19AM -0800, Roland Dreier wrote:
>     Michael> By the way, I was looking at using RCU to reduce locking,
>     Michael> also for thing like poll_cq. What do you say to that?
> 
> Unless it's a dramatic speedup, we should avoid RCU because it seems
> RCU can only be used with GPL code, not dual GPL/BSD.

"dual GPL/BSD" means you can choose whether you want to use the code 
under the GPL or under a BSD licence.

Therefore, it's simply GPL code.

And even in the other case, the 3-clause BSD licence is compatible with 
the GPL.

>  - Roland

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============18720879333264806==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18720879333264806==--
