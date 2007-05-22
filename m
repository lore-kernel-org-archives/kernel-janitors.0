From: Yoann Padioleau <padator@wanadoo.fr>
Date: Tue, 22 May 2007 08:21:37 +0000
Subject: Re: [KJ] [PATCH] potential parse error in ifdef
Message-Id: <873b1p5kvi.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87fy5q5dxr.fsf@wanadoo.fr>
In-Reply-To: <87fy5q5dxr.fsf@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Matthew Wilcox <matthew@wil.cx> writes:

> On Mon, May 21, 2007 at 06:39:12PM +0200, Yoann Padioleau wrote:
>> I have made a tool to parse the kernel that does not pre-process the
>> source. That means that my parser tries to parse all the code, including
>> code in the #else branch or code that is not often compiled because
>> the driver is not very used (or not used at all). So, my parser
>> sometimes reports parse error not originally detected by gcc. 
>> Here is my (first) patch.
>
> These all look good to me.

Thanks. 

>
> Acked-by: Matthew Wilcox <matthew@wil.cx>

Should I CC my patch to LKML ? 



> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
