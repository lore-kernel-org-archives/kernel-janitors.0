From: Domen Puncer <domen@coderock.org>
Date: Fri, 18 Mar 2005 11:58:27 +0000
Subject: Re: [KJ] [PATCH] security/selinux/ss/policydb.c: fix sparse warnings
Message-Id: <20050318115827.GD4006@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56825353269585954=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200503100150.40495.adobriyan@mail.ru>
In-Reply-To: <200503100150.40495.adobriyan@mail.ru>
To: kernel-janitors@vger.kernel.org

--===============56825353269585954==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/03/05 01:50 +0200, Alexey Dobriyan wrote:
> Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>
> 
> Index: linux-2.6.11-bk3-sparse/security/selinux/ss/policydb.c

Hunks 4 and 10 didn't apply cleanly (and fix didn't seem trivial), so i
excluded them.
Also, 7/7 hunks of security/selinux/ss/mls.c patch fail, so... dropped


	Domen

--===============56825353269585954==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56825353269585954==--
