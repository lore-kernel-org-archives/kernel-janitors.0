From: walter harms <wharms@bfs.de>
Date: Thu, 26 Oct 2006 19:45:48 +0000
Subject: Re: [KJ] make pdfdocs broken in 2.6.19rc2 and needs fixes
Message-Id: <4541106C.7080802@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200610222347.42418.ak@suse.de>
In-Reply-To: <200610222347.42418.ak@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Alan Cox wrote:
> Ar Sul, 2006-10-22 am 23:47 +0200, ysgrifennodd Andi Kleen:
>> When you do make pdfdocs  with 2.6.19rc2-git7 you get tons of error 
>> messages and  then some corrupted PDFs in the end.
> 
> Some vendor shipped pdf and TeX tools are problematic. It works
> correctly on Red Hat except for kernel-api which has become too big for
> the default settings when ext4 was added. The TeX hash size gets
> exceeded, TeX emits
> 
> "! TeX capacity exceeded, sorry [hash size`000].
> If you really absolutely need more capacity,
> you can ask a wizard to enlarge me."
> 


mmmh, roff supports pdf these days also ;)



> 
> Really it would be nice to find a more modern way from the input to pdf
> without going via tex.
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
