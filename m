From: Grant Coady <lkml@dodo.com.au>
Date: Thu, 28 Jul 2005 21:17:50 +0000
Subject: Re: [KJ] 2.6 kbuild inconsistent CONFIG_DEBUG_INFO usage?
Message-Id: <1oiie1td4glegvt7lrn2khv00ib90dsi7j@4ax.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31766995013565125=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
In-Reply-To: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
To: kernel-janitors@vger.kernel.org

--===============31766995013565125==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 28 Jul 2005 13:38:43 -0700, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
>
>I believe that setting CONFIG_VAR to 'n' in a .config file (which
>is all a defconfig is) is equivalent to saying # CONFIG_VAR is not set.

>But I haven't tried it. See what happens when you do for your system. If

That _is_ my point, Makefile turns on debug symbols if the flag is 
set, not on what value the flag is set to.

Grant.


--===============31766995013565125==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31766995013565125==--
