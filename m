From: Domen Puncer <domen@coderock.org>
Date: Sat, 18 Dec 2004 09:58:56 +0000
Subject: [KJ] Re: kernel-2.6.9: make sock_init() notice errors
Message-Id: <20041218095856.GA3754@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86890321460162001=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041215160106.GA5321@nd47.coderock.org>
In-Reply-To: <20041215160106.GA5321@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============86890321460162001==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15/12/04 18:27 +0100, walter harms wrote:
> 
> Hi domen, hi list,
> 
> its true that the user can not do much about missing memmory but he 
> should know WHAT error occured.
> NTL not checking returncodes is an error.
> Continuing when one earlier function did not work is also an error and 
> may cause problems in unexspected places.
> Since this is an init code its no performance consideration to be made.

Ok, fair enough; if you fix whitespace i'll include it.

> 
> re,
> walter
> 
> 
> 
> Domen Puncer wrote:
> >Also, there's still whitespace damage like:
> >
> >>+	ret=init_inodecache();
> >>+	if ( ret < 0 ) {

--===============86890321460162001==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86890321460162001==--
