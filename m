From: Gustavo Franco <stratus@acm.org>
Date: Thu, 09 Dec 2004 12:52:09 +0000
Subject: Re: [KJ] patches: delete 75 unused files
Message-Id: <1102596729.4616.9.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90445344799014138=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041208155439.GC31550@nd47.coderock.org>
In-Reply-To: <20041208155439.GC31550@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============90445344799014138==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-12-08 at 17:15 -0500, Jim Nelson wrote:
> [...]
> > 
> > Yes, i see more skel stuff inside the tree and i think that it needs
> > some discussion or at least don't use skeleton as part of a file name
> > that will be compiled. AFAIK, we've some of them sitting at
> > arch/m68k/..., but i can't check atm. What do you think?
> > 
>
>
> Why not make a Documentation/driver-skeletons.txt?  I can write it, if everyone 
> can point me in the direction of where all the skeleton and example files are.

I agree, you're free to submit it but i've no idea if it will be
accepted. 

`find . -name *skel*` under the tree is a good guess, but you'll see
some files that aren't skeletons. Actually, we can't say that all
skeletons are with *skeleton* in their filenames, you can start the
documention with these above and after that ask at lkml for more. 


Hope that helps,
Gustavo Franco -- <stratus@acm.org>



--===============90445344799014138==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90445344799014138==--
