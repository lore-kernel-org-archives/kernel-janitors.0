From: Domen Puncer <domen@coderock.org>
Date: Wed, 15 Dec 2004 16:01:06 +0000
Subject: [KJ] Re: kernel-2.6.9: make sock_init() notice errors
Message-Id: <20041215160106.GA5321@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64553303142624152=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64553303142624152==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/11/04 17:26 +0100, walter harms wrote:
> Hi list,
> by accident i found that that sock_init never checks the return code of
> called init functions. I have no idea why this is not done so i added
> only a printk() to inform the user about the problem.
> The function returns no error indicator. i left it this way.

I don't like this patch: it doesn't really do anything useful...
ie. if user runs out of memory on boot, he'll have other problems
than caring about sock_init failing somewhere.

Comments?

Also, there's still whitespace damage like:
> +	ret=init_inodecache();
> +	if ( ret < 0 ) {

--===============64553303142624152==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64553303142624152==--
