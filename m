From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Mon, 12 Jan 2004 04:42:49 +0000
Subject: Re: [Kernel-janitors] TODO suggestions.
Message-Id: <20040112044249.GC4694@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073548328.2024.27.camel@telecentrolivre>
In-Reply-To: <1073548328.2024.27.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are a handful of schedule() within spinlocks. That needs to
be looked at.

Also, how about an atomic version of check_region() to avoid racy
conditions? Any idea what the status is?

Eugene

<quote sender="Randy.Dunlap">
> On Thu, 08 Jan 2004 05:52:08 -0200 Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br> wrote:
> 
> | 

[snip]

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
