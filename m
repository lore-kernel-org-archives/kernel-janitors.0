From: Grant Coady <lkml@dodo.com.au>
Date: Thu, 28 Jul 2005 19:40:01 +0000
Subject: Re: [KJ] 2.6 kbuild inconsistent CONFIG_DEBUG_INFO usage?
Message-Id: <t2cie1t8trfphhk9rr9uosl3rqqtkvqu1k@4ax.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88902002459962071=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
In-Reply-To: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
To: kernel-janitors@vger.kernel.org

--===============88902002459962071==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 27 Jul 2005 21:43:52 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
>
>Were you asking a question with all of this? All of these are
>defconfigs, which are basically machine specific config files (helps
>with first build).
Sure, but why does this statement:
"
- Fix gcc 4 warnings.
  [D: http://marc.theaimsgroup.com/?t=110348353800003]
  Note: Set CONFIG_DEBUG_INFO=n to make compiles faster and smaller.
"
appear in http://janitor.kernelnewbies.org/TODO ??

Most users test if the flag is set, some users test == 'y', nothing 
checks for == 'n'.  So if I "Set CONFIG_DEBUG_INFO=n" I get unwanted 
debugging info, opposite result to what was intended?

Grant.


--===============88902002459962071==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88902002459962071==--
