From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 03 Mar 2005 20:34:28 +0000
Subject: Re: [KJ] 2.6.11-kj
Message-Id: <20050303203428.GI4608@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7909581432538868=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302095710.GA3745@nd47.coderock.org>
In-Reply-To: <20050302095710.GA3745@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============7909581432538868==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 09:43:39AM -0800, Nishanth Aravamudan wrote:
> 
> I do not see these compile-time warnings. Admittedly, that warning is
> also rather difficult to justify in the kernel, as code with local
> variables declared in the middle of functions is relatively common :)
> 
> It could just be that I need to modify my gcc flags, though... In any
> case, I'm not sure how big of a problem this is, but of course am
> willing to fix it, if so desired.

gcc < 2.96 gives a compile error for mixing them (and gcc 2.95 is a 
supported compiler for the kernel).

gcc >= 3.4 has a warning option (activated in the kernel) for this 
mixing.

> Thanks,
> Nish


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============7909581432538868==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7909581432538868==--
