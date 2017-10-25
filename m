From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Oct 2017 06:35:19 +0000
Subject: Re: Clarification for approaches around exception handling
Message-Id: <1c595ff5-9534-2b3f-38d4-970418ed8b25@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
 <20171025060104.vlk546frvmjici37@mwanda>
In-Reply-To: <20171025060104.vlk546frvmjici37@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, LKML <linux-kernel@vger.kernel.org>

> But anyways I guess other people sometimes disagree with me.

Am I one of them?   ;-)


> Unwinding is for when you allocate five things in a row.

This is a general issue.

I find that it is also needed in this function as usual.


> You have to undo four if the last allocation fails.

Concrete numbers might help to clarify another example.


> But say you have to take a lock part way through and drop it before
> the end of the function.  The lock/unlock is not part of the list
> of five resources that you want the function to take so it doesn't
> belong in the unwind code.

Such a view is useful to some degree.


> If you add the lock/unlock to the unwind code, then it makes things a
> bit tricky because then you have to do funny things like:
> 
> free_four:
> 	free(four);
> 	goto free_three:  <-- little bunny hop
> unlock:                   <-- less useful label
> 	unlock();
> free_three:
> 	free_three();
> free_two:
> 	free(two);
> free_one:
> 	free(one);
> 
> 	return ret;
> 
> It's better to just do the unlocking before the goto.

I would prefer to store such an action also only so often in the code
as it is really required.


> That way the lock and unlock are close together.

It might look nice occasionally.


> 	if (!four) {
> 		unlock();
> 		ret = -EFAIL;
> 		goto free_three;
> 	}
> 
> Of course, having a big unlock label makes sense if you take a lock at
> the start of the function and need to drop it at the end.  But in this
> case we are taking a  lock then dropping it, and taking the next, then
> dropping it and so on.  It's a different situation.

Lock scopes can interfere with a preferred control flow, can't they?


I have got the impression that your detailed reply could have been
more appropriate for update suggestions around other software modules.

Regards,
Markus
