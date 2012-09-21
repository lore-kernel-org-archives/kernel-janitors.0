From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 21 Sep 2012 06:17:28 +0000
Subject: Re: [PATCH] Fix misspellings of "whether" in comments.
Message-Id: <alpine.LNX.2.00.1209210815141.22959@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1348105682-25196-3-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1348105682-25196-3-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 20 Sep 2012, Dan Carpenter wrote:

> To be honest, I have no idea what's going on in the trivial tree
> these days or what the rules are there.

Frankly, there are no strict rules. The patch has to qualify as described 
in Documentation/SubmittingPatches, but that's basically it.

> But my instinct says that this would be better broken up into per 
> subsystem patches and sent through the normal trees.  Patches that touch 
> a ton of files like this are hard to merge all at once. Someone is going 
> to be changing some files and you'll get conflicts.

I am taking cross-subtree patches into trivial.git if they are not causing 
super-huge conflics in linux-next, and I handle the conflict resolution 
myself when pushing to Linus.

But I don't mind if it goes through subsystem maintainers instead if both 
parties prefer it that way.

-- 
Jiri Kosina
SUSE Labs
