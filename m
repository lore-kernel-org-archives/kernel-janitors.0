From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 28 Aug 2006 18:00:32 +0000
Subject: Re: [KJ] [PATCH] Removed unreachable code and fixed one	compiler
Message-Id: <44F32F40.1040007@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156784251.4195.7.camel@localhost.localdomain>
In-Reply-To: <1156784251.4195.7.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ville palo wrote:

>On Mon, 2006-08-28 at 18:59 +0200, Benoit Boissinot wrote:
>  
>
>>You are removing the comments here, and it is useful information to
>>understand the code.
>>
>>    
>>
>
>Yes, you are right, here's the fixed patch:
>
>
>Signed-off-by: Ville Palo <ville.palo@vi64pa.net>
>
>  
>
<slice>

> 	goto again;
>@@ -1710,11 +1707,8 @@ static int mcdx_tray_move(struct cdrom_d
> 	if (!(stuffp->present & DOOR))
> 		return -ENOSYS;
> 
>-	if (position)		/* 1: eject */
>-		return mcdx_talk(stuffp, "\xf6", 1, NULL, 1, 5 * HZ, 3);
>-	else			/* 0: close */
>-		return mcdx_talk(stuffp, "\xf8", 1, NULL, 1, 5 * HZ, 3);
>-	return 1;
>+	/* If position is 1 then eject, otherwise close */
>+	return mcdx_talk(stuffp, position ? "\xf6" : "\xf8", 1, NULL, 1, 5 * HZ, 3);
> }
> 
>
Not to be picky, but isn't it: "If position is 0 then close, otherwise 
eject"? ;)

Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
