From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 13 Jan 2004 18:49:55 +0000
Subject: Re: [Kernel-janitors] stat64() series of calls in 2.6.x
Message-Id: <20040113104955.72e462ed.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.44.0401131637300.23658-100000@diskbox.stillhq.com>
In-Reply-To: <Pine.LNX.4.44.0401131637300.23658-100000@diskbox.stillhq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 13 Jan 2004 16:54:03 +1100 (EST) Michael Still <mikal@stillhq.com> wrote:

| Hey,
| 
| I've been looking at the stat64() series of calls in fs/stat.c, which all 
| take three arguements: a file descriptor, a pointer to a struct stat64 
| buffer, and a long arguement for flags.
| 
| The flags arguement is never used, and a google shows me patches to add 
| stat64 support to glibc which ignore this argument. I've also checked the 
| glibc code from their CVS, and they don't appear to be using this 
| argument.
| 
| Perhaps I'm blind, but can someone give me a pointer as to why this 
| arguement is there? If no one is using it, isn't it a little dangerous 
| having it here?

I dunno.  I'm told that we should just delete those <flags> args from
those 3 syscalls.

--
~Randy
MOTD:  Always include version info.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
