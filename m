From: Domen Puncer <domen@coderock.org>
Date: Wed, 06 Jul 2005 18:23:13 +0000
Subject: Re: [KJ] [PATCH 2.6.13-rc1 14/17] fix sparse warnings [UPDATE 1/2]
Message-Id: <20050706182313.GC10429@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30873896973522874=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200507031904.44301.victor@cetuc.puc-rio.br>
In-Reply-To: <200507031904.44301.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============30873896973522874==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 05/07/05 14:53 +0000, Victor Fusco wrote:
> On 03/07/05 2005 14:00, Domen Puncer wrote:
> > >  include/linux/security.h |    8 +++++---
> > 
> > How is this related to net/?
> > 
> 
> Description:
>     Fix the sparse warning "implicit cast to nocast type"
> 
> File/Subsystem: include/linux/security.h
> 

New warnings:
+security/dummy.c:992: warning: assignment from incompatible pointer type
+security/selinux/hooks.c:4411: warning: initialization from incompatible pointer type

--===============30873896973522874==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30873896973522874==--
