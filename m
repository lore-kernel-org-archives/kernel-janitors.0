From: Bryce Harrington <bryce@osdl.org>
Date: Wed, 20 Sep 2006 22:05:58 +0000
Subject: Re: [KJ] [PATCH] Fix for some typos in Documentation/makefiles.txt
Message-Id: <20060920220558.GF17157@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060920194337.GD17157@osdl.org>
In-Reply-To: <20060920194337.GD17157@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 20, 2006 at 11:10:25PM +0200, Sam Ravnborg wrote:
> On Wed, Sep 20, 2006 at 12:43:37PM -0700, Bryce Harrington wrote:
> > Hi Kai,
> > 
> > I noticed a few typos while reading makefiles.txt to learn about the
> > kbuild system.  Attached is a patch against 2.6.18 to fix them.
> 
> Thanks Bryce.
> 
> I will apply is as soon as I get the kbuild.git tree in proper shape
> for 2.6.19.
> 
> 	Sam

Great, thanks.  If you don't mind, I also have a question about kbuild...

For automated kernel testing when we wish to customize a config, such as
iterating through memory models, tuning settings, experimental features,
etc. we can do this through simple substitutions.

However, this doesn't handle dependencies, such as if choice of a given
memory model should alter other config settings.

Do you know of a tool or technique which can be used from the
commandline to alter an arbitrary symbol's value in a given .config
file, and cascade the change to any dependent symbols, using a given
kernel Kconfig?

From what I have gathered, there is no such thing that does exactly
this; do you know if this is true?

Bryce


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
