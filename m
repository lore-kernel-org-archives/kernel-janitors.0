From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 28 Jul 2005 20:38:43 +0000
Subject: Re: [KJ] 2.6 kbuild inconsistent CONFIG_DEBUG_INFO usage?
Message-Id: <20050728203843.GB2749@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============078802419747576513=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
In-Reply-To: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
To: kernel-janitors@vger.kernel.org

--===============078802419747576513==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 29.07.2005 [05:40:01 +1000], Grant Coady wrote:
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

I believe that setting CONFIG_VAR to 'n' in a .config file (which
is all a defconfig is) is equivalent to saying # CONFIG_VAR is not set.
But I haven't tried it. See what happens when you do for your system. If
they are equivalent, then you don't need to check for y/n, you check
ifdef/ifndef. If not...well, we'll cross that bridge when we get there
:)

Thanks,
Nish

--===============078802419747576513==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============078802419747576513==--
