From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Oct 2017 06:01:04 +0000
Subject: Re: [PATCH 1/2] drm/rcar-du: Use common error handling code in rcar_du_encoders_init()
Message-Id: <20171025060104.vlk546frvmjici37@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
In-Reply-To: <9fafa688-f699-c587-ef77-840efa71bf76@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This is a subtle thing but my preference on this type of thing is the
way the original code is written.  I'm still slightly annoyed that
someone once made me rewrite a patch using the new style...  But anyways
I guess other people sometimes disagree with me.

Unwinding is for when you allocate five things in a row.  You have
to undo four if the last allocation fails.  But say you have to take a
lock part way through and drop it before the end of the function.  The
lock/unlock is not part of the list of five resources that you want the
function to take so it doesn't belong in the unwind code.

If you add the lock/unlock to the unwind code, then it makes things a
bit tricky because then you have to do funny things like:

free_four:
	free(four);
	goto free_three:  <-- little bunny hop
unlock:                   <-- less useful label
	unlock();
free_three:
	free_three();
free_two:
	free(two);
free_one:
	free(one);

	return ret;

It's better to just do the unlocking before the goto.  That way the
lock and unlock are close together.

	if (!four) {
		unlock();
		ret = -EFAIL;
		goto free_three;
	}

Of course, having a big unlock label makes sense if you take a lock at
the start of the function and need to drop it at the end.  But in this
case we are taking a  lock then dropping it, and taking the next, then
dropping it and so on.  It's a different situation.

regards,
dan carpenter

