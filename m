From: walter harms <wharms@bfs.de>
Date: Fri, 28 Oct 2011 07:33:11 +0000
Subject: Re: [patch] [ALSA] hwdep: silence integer overflow warning
Message-Id: <4EAA5AB7.9000903@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111020060910.GA6101@elgon.mountain> <4E9FD02B.6030307@bfs.de>
	<20111028064525.GA14707@longonot.mountain>
In-Reply-To: <20111028064525.GA14707@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Takashi Iwai <tiwai@suse.de>, Paul Gortmaker <paul.gortmaker@windriver.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org



Am 28.10.2011 08:45, schrieb Dan Carpenter:
> On Thu, Oct 20, 2011 at 09:39:23AM +0200, walter harms wrote:
>> I am not sure how SNDRV_MINOR_HWDEPS is used further
> 
> Either device = SNDRV_MINOR_HWDEPS or device = SNDRV_MINOR_HWDEPS + 1
> are fine (equivalent) but it's a fair point.  Your version is nicer.
> 
> I'll redo the patch.
> 

An other question is:
Should the user be informed that the device is modified ?
The Problem i see is that a user parameter is silently modified
and buggy code will come through.

re,
 wh
