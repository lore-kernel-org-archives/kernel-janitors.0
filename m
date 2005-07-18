From: Jim Cromie <jcromie@divsol.com>
Date: Mon, 18 Jul 2005 18:10:12 +0000
Subject: Re: [KJ] RFC - trailing whitespace cleanup script
Message-Id: <42DBF084.3050106@divsol.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D9C495.2090405@divsol.com>
In-Reply-To: <42D9C495.2090405@divsol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Domen Puncer wrote:

>On 16/07/05 20:38 -0600, Jim Cromie wrote:
>  
>
>>Domen, all,
>>    
>>
>
>Hi.
>
>  
>
>>Ive considered running following 1-lineer and submitting per-subsystem 
>>cleanup patches.
>>
>>    
>>
>No, no, no, and again no. And I do hate trailing whitespace, I have
>it coloured red in vim, so there's really no other way than hating.
>
>So... why not?
>- Maintainers will want to kill us, because no patch will apply
>  anymore.
>- It would generate _lots_ of traffic.
>- It would make it harder to trace bugs ("try to unapply that patch")
>- I could probably think of some more, but first one makes it
>  obsolete anyways. ;-)
>
>
>When could whitespace fixes be good?
>Maybe on a driver that is in bug-fix-only state and is expected to
>stay in kernel for a while (IOW, is not broken :-) ).
>  
>
OK, nevermind.

and pls disregard msg I just sent, b4 seeing this one.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
