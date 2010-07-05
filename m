From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Date: Mon, 05 Jul 2010 21:37:37 +0000
Subject: Re: Keeping up to date with the upstream
Message-Id: <201007052337.37575.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278362590.5396.35.camel@dermezel>
In-Reply-To: <1278362590.5396.35.camel@dermezel>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am Montag 05 Juli 2010 23:11:22 schrieben Sie:
> So if I understand you correctly should finish my patching first on my
> current branch then checkout master and git reset --hard origin and do
> clean up then go on with something else as obviously those patches will
> not be in and the work I have done is now the patch.
> 
> And then from now on just make patches on the master and not worry about
> branches since I will keep up to date with the upstream anyway, must
> just make sure I have created my patches before syncing the upstream as
> to not loose the work I have done.


That's at least how I handle the linux-next tree for my buildfailure fixes.
I'm not sure if it is the 'correct' way, however it works quite well for me.

The advantages are that your patch is always up to date with upstream - since 
you're usually less than one day behind.

The drawback is that you lose your changes with each --reset -- however when 
you create a patch with git format-patch you have a copy of your changes 
always at hand - and you can perhaps reapply them.

Peter


