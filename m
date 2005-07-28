From: Domen Puncer <domen@coderock.org>
Date: Thu, 28 Jul 2005 20:21:49 +0000
Subject: Re: [KJ] 2.6 kbuild inconsistent CONFIG_DEBUG_INFO usage?
Message-Id: <20050728202149.GE2249@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50394641785535255=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
In-Reply-To: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
To: kernel-janitors@vger.kernel.org

--===============50394641785535255==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 29/07/05 05:40 +1000, Grant Coady wrote:
> On Wed, 27 Jul 2005 21:43:52 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
> >
> >Were you asking a question with all of this? All of these are
> >defconfigs, which are basically machine specific config files (helps
> >with first build).
> Sure, but why does this statement:
> "
> - Fix gcc 4 warnings.
>   [D: http://marc.theaimsgroup.com/?t=110348353800003]
>   Note: Set CONFIG_DEBUG_INFO=n to make compiles faster and smaller.
> "
> appear in http://janitor.kernelnewbies.org/TODO ??
> 
> Most users test if the flag is set, some users test == 'y', nothing 
> checks for == 'n'.  So if I "Set CONFIG_DEBUG_INFO=n" I get unwanted 
> debugging info, opposite result to what was intended?

CONFIG_DEBUG_INFO == y compiles debugging info in kernel, and is
useful for kernel debuggers (and probably more).
For compile tests this option doesn't really mater, as it is not
compile time debugging. But disabling it makes compiles faster,
which is good.


	Domen

--===============50394641785535255==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50394641785535255==--
