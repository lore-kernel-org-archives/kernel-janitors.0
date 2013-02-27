From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Feb 2013 21:56:30 +0000
Subject: Re: [patch 1/2] wlan-ng: clean up prism2sta_inf_chinforesults()
Message-Id: <20130227215630.GR9138@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130227051206.GA22703@longonot.mountain>
In-Reply-To: <20130227051206.GA22703@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Feb 27, 2013 at 10:42:23PM +0100, walter harms wrote:
> but i am missing the point why where are two counters.
> i is simple. it is used to check the bitfield hw->channel_info.results.scanchannels
> n is increased only the when a bit is set. So it would be more easy to simply
> count the bits and run the loop about that number.
> But i can also imagine that the bitfield act as "enable" and the author actualy
> should read &inf->info.chinforesult.result[i];
> 
> perhaps i am missing the point, could someone tell me were i am wrong ?
> 

I don't understand how you're confused.  You've described the code
perfectly.  One is incremented for every iteration and one is only
incremented if we find what we're looking for.

Anyway, the point of the cleanup was just so I could add a range
check in patch 2/2 but the original code was too ugly to look at.

regards,
dan carpenter

