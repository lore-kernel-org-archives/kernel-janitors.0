From: Andrew Morton <akpm@osdl.org>
Date: Thu, 02 Nov 2006 00:27:27 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <20061101162727.72f1183b.akpm@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net>
	<1161660875.10524.535.camel@localhost.localdomain>
	<20061024125306.GA1608@hmsreliant.homelinux.net>
	<1161729762.10524.660.camel@localhost.localdomain>
	<20061101135619.GA3459@hmsreliant.homelinux.net>
	<9a8748490611011605u55ccdcaeob99700d6e1a813a4@mail.gmail.com>
	<20061101161155.d7b30258.randy.dunlap@oracle.com>
In-Reply-To: <20061101161155.d7b30258.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Jesper Juhl <jesper.juhl@gmail.com>, Neil Horman <nhorman@tuxdriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, maxk@qualcomm.com, linux-kernel@vger.kernel.org

On Wed, 1 Nov 2006 16:11:55 -0800
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> > Hmm, I guess that should be defined once and for all in
> > Documentation/CodingStyle
> 
> I have some other CodingStyle changes to submit, but feel free
> to write this one up.

Starting labels in column 2 gives me the creeps, personally.  But there's a
decent justification for it.

> However, I didn't know that we had a known style for this, other
> than "not indented so far that it's hidden".
> 
> If a label in column 0 [0-based :] confuses patch, then that's
> a reason, I suppose.  I wasn't aware of that one...
> In a case like that, we usually say "fix the tool then."

The problem is that `diff -p' screws up and displays the label: in the
place where it should be displaying the function name.

Of course, lots of people forget the -p anyway...  Maybe we can fix those
tools ;)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
