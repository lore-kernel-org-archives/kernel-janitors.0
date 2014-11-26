From: Theodore Ts'o <tytso@mit.edu>
Date: Wed, 26 Nov 2014 01:16:23 +0000
Subject: Re: [1/1] fs-ext4: Deletion of an unnecessary check before the function call "iput"
Message-Id: <20141126011623.GA20977@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54679938.3020106@users.sourceforge.net>
In-Reply-To: <54679938.3020106@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Sat, Nov 15, 2014 at 07:19:36PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 15 Nov 2014 19:04:06 +0100
> 
> The iput() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks, applied.

						- Ted
