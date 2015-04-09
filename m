From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 14:40:36 +0000
Subject: Re: [PATCH 2/2] ide: replace GFP_ATOMIC by GFP_KERNEL
Message-Id: <20150409144036.GB16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428579988-10167-1-git-send-email-lambert.quentin@gmail.com>
 <1428579988-10167-3-git-send-email-lambert.quentin@gmail.com>
 <20150409123633.GN10964@mwanda>
 <55268DCB.3010201@gmail.com>
In-Reply-To: <55268DCB.3010201@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2015 at 04:33:47PM +0200, Quentin Lambert wrote:
> 
> 
> On 09/04/2015 14:36, Dan Carpenter wrote:
> >Oh.  They're not GFP_ATOMIC.
> >
> >Fold these two patches together into one patch and resend.
> The reason I did it that way is because I feel that the two patches
> really are different.
> The first one do not change the execution of the code but the second
> one does.
> Could you explain to me why they can be folded into one ?

When I read the first patch it left me with unanswered questions and I
was planning to ask you to redo it.  After you had fixed 1/1 there is no
need for 2/2.

regards,
dan carpenter
