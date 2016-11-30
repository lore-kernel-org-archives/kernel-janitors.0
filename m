From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2016 14:45:22 +0000
Subject: Re: [patch] [media] uvcvideo: freeing an error pointer
Message-Id: <20161130144522.GJ28558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161125102835.GA5856@mwanda>
 <13737175.iVr8OcoHqv@avalon>
 <20161130123326.GH28558@mwanda>
 <3099994.m2oKJeJMud@avalon>
In-Reply-To: <3099994.m2oKJeJMud@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Sakari Alius <sakari.ailus@iki.fi>, wharms@bfs.de, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Nov 30, 2016 at 03:53:03PM +0200, Laurent Pinchart wrote:
> But then you get the following patch (which, apart from being totally made up, 
> probably shows what I've watched yesterday evening).
> 
> @@ ... @@
>  		return -ENOMEM;
>  	}
>  
> +	ret = check_time_vortex();
> +	if (ret < 0)
> +		goto power_off_tardis;
> +
> 	matt_smith = alloc_regeneration();
> 	if (math_smith->status != OK) {
> 		ret = -E_NEEDS_FISH_FINGERS_AND_CUSTARD;
> 


I don't get it.  Did we power on the tardis on the lines before?  That's
all the state that you need to keep in your head is just the most
recently allocated thing.

> >From that code only you can't tell whether the jump label is the right one. If 
> a single jump label is used with an unwinding code block that supports non-
> allocated resources, you don't have to ask yourself any question.
> 

You absolutely do have to ask that question, you just can't answer it
without jumping back and forth.  Doing everything at once is logically
more complicated than doing them one thing at a time, and empirically
just from looking at which code has the most bugs, then single exit
labels are the most buggy.

regards,
dan carpenter

