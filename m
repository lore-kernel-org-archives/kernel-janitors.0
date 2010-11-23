From: Dan Carpenter <error27@gmail.com>
Date: Tue, 23 Nov 2010 05:12:59 +0000
Subject: Re: [PATCH v2] fs: select: fix information leak to userspace
Message-Id: <20101123051259.GF1522@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421483-23907-1-git-send-email-segooon@gmail.com>
 <20101112120834.33062900.akpm@linux-foundation.org>
 <8D90F8B2-EA29-4EB9-9807-294CE0D5523B@dilger.ca>
 <20101114092533.GB5323@albatros>
 <20101114180643.593d19ac.akpm@linux-foundation.org>
 <1289848341.2607.125.camel@edumazet-laptop>
 <4CE268C8.5010203@panasas.com>
 <20101122155043.fbbb74f4.akpm@linux-foundation.org>
 <1290471649.2704.24.camel@edumazet-laptop>
 <20101122163234.5470e33e.akpm@linux-foundation.org>
In-Reply-To: <20101122163234.5470e33e.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Boaz Harrosh <bharrosh@panasas.com>, Vasiliy Kulikov <segoon@openwall.com>, Andreas Dilger <adilger.kernel@dilger.ca>, kernel-janitors@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>

On Mon, Nov 22, 2010 at 04:32:34PM -0800, Andrew Morton wrote:
> On Tue, 23 Nov 2010 01:20:48 +0100
> Eric Dumazet <eric.dumazet@gmail.com> wrote:
> 
> > Le lundi 22 novembre 2010 __ 15:50 -0800, Andrew Morton a __crit :
> > 
> > > Well.  We certainly assume in many places that
> > > 
> > > 	struct foo {
> > > 		int a;
> > > 		int b;
> > > 	} f = {
> > > 		.a = 1,
> > > 	};
> > > 
> > > will initialise b to zero.  But I doubt if much code at all assumes
> > > that this initialisation patterm will reliably zero out *holes* in the
> > > struct.
> > > 
> > 
> > We did such assertions in the past, we were wrong.

Well, that sucks...  I know I wrote some code that relied on holes
getting zeroed as well.  Is there no option to GCC to make this work?

regards,
dan carpenter

