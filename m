From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Mon, 12 Jan 2004 23:36:28 +0000
Subject: Re: [Kernel-janitors] TODO suggestions.
Message-Id: <20040112233628.GA9373@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073548328.2024.27.camel@telecentrolivre>
In-Reply-To: <1073548328.2024.27.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<quote sender="Randy.Dunlap">
> On Mon, 12 Jan 2004 12:42:49 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:
> 
> | There are a handful of schedule() within spinlocks. That needs to
> | be looked at.
> 
> Are these listed somewhere, like by smatch/kbugs.org ?

yes

> 
> Thanks.
> --
> ~Randy
> 

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
