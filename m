From: Grant Coady <lkml@dodo.com.au>
Date: Thu, 28 Jul 2005 21:14:57 +0000
Subject: Re: [KJ] 2.6 kbuild inconsistent CONFIG_DEBUG_INFO usage?
Message-Id: <50iie1le7vka54v3afub2n7ljdvd05fqi8@4ax.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64775770591978254=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
In-Reply-To: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
To: kernel-janitors@vger.kernel.org

--===============64775770591978254==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 28 Jul 2005 22:21:49 +0200, Domen Puncer <domen@coderock.org> wrote:
>> 
>> Most users test if the flag is set, some users test == 'y', nothing 
>> checks for == 'n'.  So if I "Set CONFIG_DEBUG_INFO=n" I get unwanted 
>> debugging info, opposite result to what was intended?
>
>CONFIG_DEBUG_INFO == y compiles debugging info in kernel, and is
>useful for kernel debuggers (and probably more).
>For compile tests this option doesn't really mater, as it is not
>compile time debugging. But disabling it makes compiles faster,
>which is good.

top-level 2.6.12.3 Makefile:
...
ifdef CONFIG_DEBUG_INFO
CFLAGS          += -g
endif
...

So please tell me how "CONFIG_DEBUG_INFO=n" disables debug?

Observations from test runs with 'make randconfig':

$ ls trial-2.6.1*/*-config |wc -l
1031
$ grep -r CONFIG_DEBUG_INFO trial-2.6.1*/*-config|wc -l
354
$ grep -r CONFIG_DEBUG_INFO trial-2.6.1*/*-config|cut -d: -f2|sort|uniq -c
    172 # CONFIG_DEBUG_INFO is not set
    182 CONFIG_DEBUG_INFO=y

Two thirds .config produced do not offer the flag.  This seems 
inconsistent usage.  Since I'm looking for build errors, I very 
much like to turn off the flag, but as it is only set in < 20% of 
random cases, this issue matters far less than I first thought.

Grant.


--===============64775770591978254==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64775770591978254==--
