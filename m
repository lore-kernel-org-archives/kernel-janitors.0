From: Sam Ravnborg <sam@ravnborg.org>
Date: Wed, 20 Sep 2006 23:41:50 +0000
Subject: Re: [KJ] [PATCH] Fix for some typos in Documentation/makefiles.txt
Message-Id: <20060920234150.GA29903@uranus.ravnborg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060920194337.GD17157@osdl.org>
In-Reply-To: <20060920194337.GD17157@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> For automated kernel testing when we wish to customize a config, such as
> iterating through memory models, tuning settings, experimental features,
> etc. we can do this through simple substitutions.
> 
> However, this doesn't handle dependencies, such as if choice of a given
> memory model should alter other config settings.
> 
> Do you know of a tool or technique which can be used from the
> commandline to alter an arbitrary symbol's value in a given .config
> file, and cascade the change to any dependent symbols, using a given
> kernel Kconfig?
> 
> From what I have gathered, there is no such thing that does exactly
> this; do you know if this is true?
Unfortunately correct.
It has been requested several times but noone has come up with
neither a good interface to kconfig to do it, nor a good implmentation
of such thing.

For someone that understands the kconfig datastructures it should be
doable but I at least have failed to get a good grip on it so far.
And Roman Zippel - the kconfig maintainer - has been busy with other stuff
lately and haven't come up with something useful either.

	Sam
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
