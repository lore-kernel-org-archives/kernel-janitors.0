From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 14 Jan 2004 04:10:51 +0000
Subject: Re: [Kernel-janitors] stat64() series of calls in 2.6.x
Message-Id: <20040113201051.29e1c573.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.44.0401131637300.23658-100000@diskbox.stillhq.com>
In-Reply-To: <Pine.LNX.4.44.0401131637300.23658-100000@diskbox.stillhq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 14 Jan 2004 14:45:37 +1100 (EST) Michael Still <mikal@stillhq.com> wrote:

| On Tue, 13 Jan 2004, Randy.Dunlap wrote:
| 
| > On Tue, 13 Jan 2004 16:54:03 +1100 (EST) Michael Still <mikal@stillhq.com> wrote:
| > 
| > | Hey,
| > | 
| > | I've been looking at the stat64() series of calls in fs/stat.c, which all 
| > | take three arguements: a file descriptor, a pointer to a struct stat64 
| > | buffer, and a long arguement for flags.
| > | 
| > | The flags arguement is never used, and a google shows me patches to add 
| > | stat64 support to glibc which ignore this argument. I've also checked the 
| > | glibc code from their CVS, and they don't appear to be using this 
| > | argument.
| > | 
| > | Perhaps I'm blind, but can someone give me a pointer as to why this 
| > | arguement is there? If no one is using it, isn't it a little dangerous 
| > | having it here?
| > 
| > I dunno.  I'm told that we should just delete those <flags> args from
| > those 3 syscalls.
| 
| I'm at linux.conf.au, and had dinner with Willy last night. He seemed to 
| think a similar thing. I will whip up some patches sometime today and send 
| them in...

I've already added it the the latest 2.6.1-kj1 patchset...

Have fun.  8:)

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
